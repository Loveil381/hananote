import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/di/injection.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/core/utils/id_generator.dart';
import 'package:hananote/features/journal/domain/entities/enums.dart';
import 'package:hananote/features/journal/domain/entities/journal_entry.dart';
import 'package:hananote/features/journal/domain/usecases/add_journal_entry.dart';
import 'package:hananote/features/journal/domain/usecases/update_journal_entry.dart';
import 'package:hananote/features/journal/presentation/bloc/record_bloc.dart';
import 'package:hananote/features/journal/presentation/bloc/record_event.dart';

/// The page for editing a journal entry.
class JournalEditPage extends StatefulWidget {
  /// Creates a [JournalEditPage].
  const JournalEditPage({super.key, this.existingEntry});

  /// The entry to edit, if any.
  final JournalEntry? existingEntry;

  @override
  State<JournalEditPage> createState() => _JournalEditPageState();
}

class _JournalEditPageState extends State<JournalEditPage> {
  final TextEditingController _contentController = TextEditingController();
  final FocusNode _contentFocusNode = FocusNode();
  MoodLevel _selectedMood = MoodLevel.good;
  final List<String> _selectedTags = [];
  bool _isSaving = false;

  List<String> _presetTags(AppLocalizations l10n) => [
        l10n.presetTagHappy,
        l10n.presetTagAnxious,
        l10n.presetTagCalm,
        l10n.presetTagTired,
        l10n.presetTagHopeful,
      ];

  @override
  void initState() {
    super.initState();
    if (widget.existingEntry != null) {
      _contentController.text = widget.existingEntry!.content;
      _selectedMood = widget.existingEntry!.mood;
      if (widget.existingEntry!.tags != null) {
        _selectedTags.addAll(widget.existingEntry!.tags!);
      }
    }
  }

  @override
  void dispose() {
    _contentController.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveEntry() async {
    final content = _contentController.text.trim();
    if (content.isEmpty) return;

    setState(() {
      _isSaving = true;
    });

    final now = DateTime.now();

    if (widget.existingEntry == null) {
      final newEntry = JournalEntry(
        id: IdGenerator.generate(),
        date: now,
        content: content,
        mood: _selectedMood,
        createdAt: now,
        tags: _selectedTags.isEmpty ? null : _selectedTags,
      );
      final addUseCase = getIt<AddJournalEntry>();
      await addUseCase(newEntry);
    } else {
      final updatedEntry = widget.existingEntry!.copyWith(
        content: content,
        mood: _selectedMood,
        tags: _selectedTags.isEmpty ? null : _selectedTags,
        updatedAt: now,
      );
      final updateUseCase = getIt<UpdateJournalEntry>();
      await updateUseCase(updatedEntry);
    }

    if (mounted) {
      // RecordBloc is a lazy singleton, so this refresh reaches RecordPage.
      getIt<RecordBloc>().add(const RecordEvent.refresh());
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isNew = widget.existingEntry == null;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: HanaColors.surfaceContainerLow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: HanaColors.primary),
          onPressed: () => context.pop(),
        ),
        title: Text(
          isNew ? l10n.writeJournal : l10n.editDiary,
          style: const TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: HanaColors.primary,
          ),
        ),
        actions: [
          if (_isSaving)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(
                Icons.check_circle_outline,
                color: HanaColors.primary,
              ),
              onPressed: _saveEntry,
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildMoodSelector(),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  controller: _contentController,
                  focusNode: _contentFocusNode,
                  maxLines: null,
                  expands: true,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: HanaColors.onSurface,
                        height: 1.6,
                      ),
                  decoration: InputDecoration(
                    hintText: l10n.diaryPlaceholder,
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: HanaColors.onSurfaceVariant
                              .withAlpha((255 * 0.5).round()),
                        ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            _buildTagsSelector(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodSelector() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: MoodLevel.values.map((mood) {
          final isSelected = _selectedMood == mood;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedMood = mood;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? HanaColors.primary.withAlpha(26)
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Text(
                mood.emoji,
                style: TextStyle(fontSize: isSelected ? 32 : 24),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTagsSelector() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.addTags,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: HanaColors.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _presetTags(l10n).map((tag) {
              final isSelected = _selectedTags.contains(tag);
              return InputChip(
                label: Text(tag),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _selectedTags.add(tag);
                    } else {
                      _selectedTags.remove(tag);
                    }
                  });
                },
                selectedColor: HanaColors.primaryContainer,
                backgroundColor: HanaColors.surfaceContainerHigh,
                labelStyle: TextStyle(
                  color: isSelected
                      ? HanaColors.onPrimaryContainer
                      : HanaColors.onSurfaceVariant,
                  fontSize: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9999),
                  side: const BorderSide(color: Colors.transparent),
                ),
                showCheckmark: false,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
