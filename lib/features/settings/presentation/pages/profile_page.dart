// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '我的',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
