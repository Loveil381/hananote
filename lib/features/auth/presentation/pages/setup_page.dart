import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';

/// First-run PIN setup page.
class SetupPage extends StatefulWidget {
  /// Creates [SetupPage].
  const SetupPage({super.key});

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final _pinController = TextEditingController();
  final _confirmController = TextEditingController();

  var _biometricEnabled = false;
  String? _errorText;

  @override
  void dispose() {
    _pinController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _clearError() {
    if (_errorText == null) {
      return;
    }
    setState(() => _errorText = null);
  }

  String? _validatePin(AppLocalizations l10n) {
    if (_pinController.text.length != 6 ||
        _confirmController.text.length != 6) {
      return l10n.setupPinLengthError;
    }
    if (_pinController.text != _confirmController.text) {
      return l10n.setupPinMismatchError;
    }
    return null;
  }

  void _submit() {
    final l10n = AppLocalizations.of(context)!;
    final errorText = _validatePin(l10n);
    if (errorText != null) {
      setState(() => _errorText = errorText);
      return;
    }

    context.read<AuthCubit>().setupPin(
          _pinController.text,
          _confirmController.text,
          biometricEnabled: _biometricEnabled,
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              HanaColors.background,
              HanaColors.surfaceContainerLow,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: HanaColors.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: HanaColors.primary.withAlpha(20),
                        blurRadius: 36,
                        offset: const Offset(0, 24),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.setupTitle,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: HanaColors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.setupDescription,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: HanaColors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          controller: _pinController,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (_) => _clearError(),
                          decoration: InputDecoration(
                            labelText: l10n.setupPinLabel,
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: HanaColors.primary,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _confirmController,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          onChanged: (_) => _clearError(),
                          decoration: InputDecoration(
                            labelText: l10n.setupConfirmLabel,
                            prefixIcon:
                                const Icon(Icons.verified_user_outlined),
                            errorText: _errorText,
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: HanaColors.primary,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SwitchListTile.adaptive(
                          contentPadding: EdgeInsets.zero,
                          value: _biometricEnabled,
                          onChanged: (value) =>
                              setState(() => _biometricEnabled = value),
                          title: Text(l10n.setupBiometricToggle),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: HanaColors.primary,
                              foregroundColor: HanaColors.onPrimary,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Text(l10n.save),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
