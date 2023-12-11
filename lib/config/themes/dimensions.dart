import 'package:flutter/material.dart';

extension Dimensions on BuildContext {
  double get sh => MediaQuery.sizeOf(this).height;
  double get sw => MediaQuery.sizeOf(this).width;
  double get st => MediaQuery.viewPaddingOf(this).top;
  double get sb => MediaQuery.viewInsetsOf(this).bottom;
}
