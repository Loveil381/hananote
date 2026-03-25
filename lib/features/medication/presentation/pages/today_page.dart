// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '今日',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
