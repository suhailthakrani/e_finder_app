import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sentiment_dissatisfied, size: 48.0),
          SizedBox(height: 16.0),
          Text('No data found.', style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}