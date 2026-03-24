import 'package:flutter/material.dart';

/// Placeholder authenticated home page for the MVP startup flow.
class HomePage extends StatelessWidget {
  /// Creates [HomePage].
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1FE08BAF),
                blurRadius: 30,
                offset: Offset(0, 18),
              ),
            ],
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock_open_rounded, size: 42, color: Color(0xFFCD6B97)),
              SizedBox(height: 16),
              Text(
                'Unlocked',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF3E2130),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The main experience will connect here next.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF7C5D6B)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
