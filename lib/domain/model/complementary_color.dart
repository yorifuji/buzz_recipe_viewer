import 'package:flutter/material.dart';

extension ComplementaryColor on Color {
  Color get complementary =>
      Color.from(alpha: a, red: 1 - r, green: 1 - g, blue: 1 - b);
}
