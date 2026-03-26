import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:hananote/features/auth/presentation/bloc/auth_state.dart';

/// Lock screen with a custom PIN keypad.
class LockScreenPage extends StatefulWidget {
  /// Creates [LockScreenPage].
  const LockScreenPage({
    required this.biometricAvailable,
    super.key,
  });

  /// Whether the biometric button should be shown.
  final bool biometricAvailable;

  @override
  State<LockScreenPage> createState() => _LockScreenPageState();
}

class _LockScreenPageState extends State<LockScreenPage> {
  String _pin = '';
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dots = List.generate(
      6,
      (index) => AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        width: 14,
        height: 14,
        decoration: BoxDecoration(
          color: index < _pin.length
              ? HanaColors.primary
              : HanaColors.outlineVariant,
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    );

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showError(state.message);
        }
      },
      child: Scaffold(
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
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          color: HanaColors.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.shield_moon_rounded,
                          size: 44,
                          color: HanaColors.primary,
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        '欢迎回来',
                        style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: HanaColors.onSurface,
                            ) ??
                            const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: HanaColors.onSurface,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: dots
                            .expand((dot) => [dot, const SizedBox(width: 10)])
                            .toList()
                          ..removeLast(),
                      ),
                      const SizedBox(height: 14),
                      AnimatedOpacity(
                        opacity: _errorMessage == null ? 0 : 1,
                        duration: const Duration(milliseconds: 180),
                        child: Text(
                          _errorMessage ?? '',
                          style: const TextStyle(
                            color: HanaColors.error,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      _PinKeypad(
                        biometricAvailable: widget.biometricAvailable,
                        onNumberTap: _handleNumberTap,
                        onBackspace: _handleBackspace,
                        onConfirm: _handleConfirm,
                        onBiometric: () =>
                            context.read<AuthCubit>().unlockBiometric(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Displays a red inline error and vibrates lightly.
  void showError(String message) {
    HapticFeedback.heavyImpact();
    setState(() => _errorMessage = message);
  }

  void clearError() {
    if (_errorMessage == null) return;
    setState(() => _errorMessage = null);
  }

  void _handleNumberTap(String digit) {
    if (_pin.length >= 6) return;
    clearError();
    setState(() => _pin += digit);
  }

  void _handleBackspace() {
    if (_pin.isEmpty) return;
    clearError();
    setState(() => _pin = _pin.substring(0, _pin.length - 1));
  }

  void _handleConfirm() {
    if (_pin.length != 6) {
      showError('请输入完整的6位密码');
      return;
    }
    final pin = _pin;
    setState(() => _pin = '');
    context.read<AuthCubit>().unlock(pin);
  }
}

class _PinKeypad extends StatelessWidget {
  const _PinKeypad({
    required this.biometricAvailable,
    required this.onNumberTap,
    required this.onBackspace,
    required this.onConfirm,
    required this.onBiometric,
  });

  final bool biometricAvailable;
  final ValueChanged<String> onNumberTap;
  final VoidCallback onBackspace;
  final VoidCallback onConfirm;
  final VoidCallback onBiometric;

  @override
  Widget build(BuildContext context) {
    final buttons = <String>[
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
    ];
    if (biometricAvailable) {
      buttons.add('bio');
    } else {
      buttons.add('');
    }
    buttons
      ..add('0')
      ..add('back');

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buttons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.15,
      ),
      itemBuilder: (context, index) {
        final token = buttons[index];
        if (token.isEmpty) {
          return const SizedBox.shrink();
        }
        if (token == 'bio') {
          return _KeyButton(
            onTap: onBiometric,
            child: const Icon(Icons.fingerprint_rounded,
                size: 28, color: HanaColors.primary,),
          );
        }
        if (token == 'back') {
          return _KeyButton(
            onTap: onBackspace,
            child: const Icon(Icons.backspace_outlined,
                size: 24, color: HanaColors.onSurfaceVariant,),
          );
        }
        return _KeyButton(
          onTap: () => onNumberTap(token),
          child: Text(
            token,
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: HanaColors.onSurface,),
          ),
        );
      },
    );
  }
}

class _KeyButton extends StatelessWidget {
  const _KeyButton({
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HanaColors.surfaceContainerLowest,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: onTap,
        child: Center(child: child),
      ),
    );
  }
}
