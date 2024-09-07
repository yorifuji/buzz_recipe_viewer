import 'package:flutter/material.dart';

extension ComplementaryColor on Color {
  Color get complementary =>
      Color.fromARGB(alpha, 255 - red, 255 - green, 255 - blue);
}
