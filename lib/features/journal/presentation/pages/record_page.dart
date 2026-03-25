import 'package:flutter/material.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '记录',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
