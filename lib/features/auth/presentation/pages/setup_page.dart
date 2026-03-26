import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hananote/app/theme/hana_colors.dart';
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

  @override
  void dispose() {
    _pinController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
                        const Text(
                          '守护你的空间',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: HanaColors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '设置密码来保护你的数据。',
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
                          decoration: const InputDecoration(
                            labelText: '密码',
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HanaColors.primary, width: 2,),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _confirmController,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          decoration: const InputDecoration(
                            labelText: '确认密码',
                            prefixIcon: Icon(Icons.verified_user_outlined),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HanaColors.primary, width: 2,),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SwitchListTile.adaptive(
                          contentPadding: EdgeInsets.zero,
                          value: _biometricEnabled,
                          onChanged: (value) =>
                              setState(() => _biometricEnabled = value),
                          title: const Text('可用时使用生物识别'),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<AuthCubit>().setupPin(
                                    _pinController.text,
                                    _confirmController.text,
                                    biometricEnabled: _biometricEnabled,
                                  );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: HanaColors.primary,
                              foregroundColor: HanaColors.onPrimary,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              child: Text('继续'),
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
