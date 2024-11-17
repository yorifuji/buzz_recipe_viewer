import 'package:flutter/material.dart';

enum AppColor {
  red('Red', Colors.red),
  pink('Pink', Colors.pink),
  purple('Purple', Colors.purple),
  deepPurple('Deep Purple', Colors.deepPurple),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  lightBlue('Light Blue', Colors.lightBlue),
  cyan('Cyan', Colors.cyan),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  lightGreen('Light Green', Colors.lightGreen),
  lime('Lime', Colors.lime),
  yellow('Yellow', Colors.yellow),
  amber('Amber', Colors.amber),
  orange('Orange(default)', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  brown('Brown', Colors.brown),
  blueGrey('Blue Grey', Colors.blueGrey),
  ;

  // constructor
  const AppColor(this.title, this.color);
  factory AppColor.fromName(String? name) {
    return AppColor.values.firstWhere(
      (e) => e.name == name,
      orElse: () => defaultColor,
    );
  }

  final String title;
  final Color color;

  static AppColor defaultColor = AppColor.orange;
}
