import 'package:flutter/material.dart';

extension ContextValues on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenwidth => MediaQuery.of(this).size.width;
  double get keyboardBottomPadding => MediaQuery.of(this).viewInsets.bottom;
}
