import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/core/l10n/enum_l10n.dart';
import 'package:hananote/core/utils/id_generator.dart';
import 'package:hananote/features/medication/domain/entities/drug.dart';
import 'package:hananote/features/medication/domain/entities/enums.dart';
import 'package:hananote/features/medication/presentation/bloc/drug_list_cubit.dart';

/// Page to add a new medication.
class AddDrugPage extends StatefulWidget {
  /// Creates an [AddDrugPage].
  const AddDrugPage({super.key});

  @override
  State<AddDrugPage> createState() => _AddDrugPageState();
}

class _AddDrugPageState extends State<AddDrugPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _genericNameController = TextEditingController();
  final _notesController = TextEditingController();

  DrugCategory _category = DrugCategory.estrogen;
  AdministrationRoute _route = AdministrationRoute.oral;
  DosageUnit? _unit;

  @override
  void initState() {
    super.initState();
    _unit = _route.supportedUnits.first;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _genericNameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _onRouteChanged(AdministrationRoute route) {
    setState(() {
      _route = route;
      if (!route.supportedUnits.contains(_unit)) {
        _unit = route.supportedUnits.first;
      }
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_unit == null) return;

    final newDrug = Drug(
      id: IdGenerator.generate(),
      name: _nameController.text.trim(),
      genericName: _genericNameController.text.trim(),
      category: _category,
      administrationRoute: _route,
      defaultDosageUnit: _unit!,
      isActive: true,
      createdAt: DateTime.now(),
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );

    context.read<DrugListCubit>().addDrug(newDrug);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.addDrug),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _submit,
            tooltip: l10n.save,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: '${l10n.drugName} *',
                border: const OutlineInputBorder(),
              ),
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return l10n.required;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _genericNameController,
              decoration: InputDecoration(
                labelText: l10n.genericName,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Text(l10n.category, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            SegmentedButton<DrugCategory>(
              segments: DrugCategory.values.map((cat) {
                return ButtonSegment(
                  value: cat,
                  label: Text(cat.localizedName(l10n)),
                );
              }).toList(),
              selected: {_category},
              onSelectionChanged: (set) {
                setState(() => _category = set.first);
              },
            ),
            const SizedBox(height: 24),
            Text(l10n.route, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: AdministrationRoute.values.map((route) {
                return ChoiceChip(
                  label: Text(route.localizedName(l10n)),
                  selected: _route == route,
                  onSelected: (val) {
                    if (val) _onRouteChanged(route);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text(l10n.unit, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _route.supportedUnits.map((unit) {
                return ChoiceChip(
                  label: Text(unit.localizedName(l10n)),
                  selected: _unit == unit,
                  onSelected: (val) {
                    if (val) setState(() => _unit = unit);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: l10n.notes,
                border: const OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 48),
            FilledButton(
              onPressed: _submit,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(l10n.save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
