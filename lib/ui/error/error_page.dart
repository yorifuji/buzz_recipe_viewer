import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.smart_toy_outlined,
            size: 32,
          ),
          Text('Oops!'),
        ],
      ),
    );
  }
}
