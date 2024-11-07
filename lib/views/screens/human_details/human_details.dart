import 'package:e_finder_app/models/human_model.dart';
import 'package:flutter/material.dart';

class HumanDetails extends StatelessWidget {
  final HumanModel human;

  HumanDetails({required this.human});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${human.firstName}'),
          SizedBox(height: 8),
          Text('ID: ${human.id}'),
          SizedBox(height: 8),
          Text('Age: ${human.age}'),
          SizedBox(height: 8),
          Text('Gender: ${human.gender}'),
        ],
      ),
    );
  }
}