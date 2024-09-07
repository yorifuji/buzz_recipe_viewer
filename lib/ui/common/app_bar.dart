import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, {String? title}) => AppBar(
      title: title == null ? null : Text(title),
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
