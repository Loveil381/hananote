import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/utils/id_generator.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_entry.dart';
import 'package:hananote/features/measurement/domain/entities/measurement_type.dart';
import 'package:hananote/features/measurement/presentation/blocs/measurement_bloc.dart';
import 'package:hananote/features/measurement/presentation/widgets/measurement_type_icon.dart';
import 'package:intl/intl.dart';

/// Create/edit page for a measurement session.
class MeasurementEditPage extends StatefulWidget {
  /// Creates a [MeasurementEditPage].
  const MeasurementEditPage({super.key, this.existingEntry});

  /// Existing entry to edit, if any.
  final MeasurementEntry? existingEntry;

  @override
  State<MeasurementEditPage> createState() => _MeasurementEditPageState();
}

class _MeasurementEditPageState extends State<MeasurementEditPage> {
  late DateTime _selectedDate;
  late final Map<MeasurementType, TextEditingController> _controllers;
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    final entry = widget.existingEntry;
    _selectedDate = entry?.date ?? DateTime.now();
    _notesController = TextEditingController(text: entry?.notes ?? '');
    _controllers = {
      for (final type in MeasurementTypes.all)
        type: TextEditingController(
          text: _initialValue(entry, type),
        ),
    };
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.existingEntry != null;

    return BlocListener<MeasurementBloc, MeasurementState>(
      listener: (context, state) {
        if (state is MeasurementSaved) {
          context.pop(true);
        } else if (state is MeasurementError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: HanaColors.background,
        appBar: AppBar(
          backgroundColor: HanaColors.surface,
          title: Text(isEditing ? '编辑测量' : '新建测量'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _DatePickerTile(
              date: _selectedDate,
              onTap: _pickDate,
            ),
            const SizedBox(height: 16),
            _MeasurementSection(
              title: '核心围度',
              types: MeasurementTypes.core,
              controllers: _controllers,
            ),
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('扩展指标'),
              backgroundColor: HanaColors.surfaceContainerLowest,
              collapsedBackgroundColor: HanaColors.surfaceContainerLowest,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              children: [
                const SizedBox(height: 8),
                _MeasurementSection(
                  title: '',
                  types: MeasurementTypes.extended,
                  controllers: _controllers,
                  showTitle: false,
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _notesController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: '备注',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<MeasurementBloc, MeasurementState>(
              builder: (context, state) {
                final isSaving = state is MeasurementSaving;
                return FilledButton(
                  onPressed: isSaving ? null : _saveEntry,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('保存'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );

    if (selected != null) {
      setState(() {
        _selectedDate = selected;
      });
    }
  }

  void _saveEntry() {
    final now = DateTime.now();
    final existing = widget.existingEntry;
    final trimmedNotes = _notesController.text.trim();
    final entry = MeasurementEntry(
      id: existing?.id ?? IdGenerator.generate(),
      date: DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
      ),
      bust: _parseValue(MeasurementType.bust),
      underbust: _parseValue(MeasurementType.underbust),
      waist: _parseValue(MeasurementType.waist),
      hip: _parseValue(MeasurementType.hip),
      thigh: _parseValue(MeasurementType.thigh),
      bicep: _parseValue(MeasurementType.bicep),
      shoulder: _parseValue(MeasurementType.shoulder),
      neck: _parseValue(MeasurementType.neck),
      weight: _parseValue(MeasurementType.weight),
      notes: trimmedNotes.isEmpty ? null : trimmedNotes,
      createdAt: existing?.createdAt ?? now,
      updatedAt: existing == null ? null : now,
    );

    context.read<MeasurementBloc>().add(
          MeasurementEvent.saveMeasurement(entry),
        );
  }

  double? _parseValue(MeasurementType type) {
    final text = _controllers[type]!.text.trim();
    if (text.isEmpty) {
      return null;
    }
    return double.tryParse(text);
  }

  static String _initialValue(MeasurementEntry? entry, MeasurementType type) {
    final value = entry?.valueFor(type);
    if (value == null) {
      return '';
    }
    return value == value.roundToDouble()
        ? value.toStringAsFixed(0)
        : value.toStringAsFixed(1);
  }
}

class _DatePickerTile extends StatelessWidget {
  const _DatePickerTile({
    required this.date,
    required this.onTap,
  });

  final DateTime date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HanaColors.surfaceContainerLowest,
      child: ListTile(
        leading: const Icon(Icons.calendar_month),
        title: const Text('测量日期'),
        subtitle: Text(DateFormat('yyyy.MM.dd').format(date)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _MeasurementSection extends StatelessWidget {
  const _MeasurementSection({
    required this.title,
    required this.types,
    required this.controllers,
    this.showTitle = true,
  });

  final String title;
  final List<MeasurementType> types;
  final Map<MeasurementType, TextEditingController> controllers;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HanaColors.surfaceContainerLowest,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (showTitle) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 12),
            ],
            for (var index = 0; index < types.length; index++) ...[
              _MeasurementInputField(
                type: types[index],
                controller: controllers[types[index]]!,
              ),
              if (index != types.length - 1) const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }
}

class _MeasurementInputField extends StatelessWidget {
  const _MeasurementInputField({
    required this.type,
    required this.controller,
  });

  final MeasurementType type;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        prefixIcon: MeasurementTypeIcon(type: type),
        labelText: '${type.displayName} (${type.unit})',
        border: const OutlineInputBorder(),
      ),
    );
  }
}
