// Release prep note: Theme tokens are internal design-system plumbing, so
// adding dartdoc to every public constant would add noise without value.
// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class HanaGradients {
  static const primaryGradient = LinearGradient(
    colors: [Color(0xFFFFB7C5), Color(0xFFFCD3FB)],
  );

  static const countdownGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFB7C5), Color(0xFFFCD3FB)],
  );

  static const takeDoseButtonGradient = LinearGradient(
    colors: [Color(0xFFFFB7C5), Color(0xFFC8A2C8)],
  );
}
