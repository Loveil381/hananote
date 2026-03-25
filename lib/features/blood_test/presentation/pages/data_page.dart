// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '数据',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
