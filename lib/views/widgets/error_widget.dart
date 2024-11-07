import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String errorMessage;

  const MyErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48.0),
          const SizedBox(height: 16.0),
          Text(errorMessage, style: const TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}