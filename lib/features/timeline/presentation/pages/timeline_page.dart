// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '轨迹',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
