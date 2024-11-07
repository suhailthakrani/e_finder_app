import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/human_list/human_list_bloc.dart';
import '../../../models/human_model.dart';
import '../human_details/human_detail_screen.dart';

class HumanList extends StatefulWidget {
  final List<HumanModel> humans;

  HumanList({required this.humans});

  @override
  _HumanListState createState() => _HumanListState();
}

class _HumanListState extends State<HumanList> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          onChanged: (value) {
            context.read<HumanListBloc>().add(SearchHumans(query: value));
          },
          decoration: const InputDecoration(
            hintText: 'Search by name or ID',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: widget.humans.length,
            itemBuilder: (context, index) {
              final human = widget.humans[index];
              return ListTile(
                tileColor: Colors.green.shade50,
                title: Text(human.firstName),
                subtitle: Text('ID: ${human.id}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HumanDetailScreen(id: human.id),
                    ),
                  );                  
                },
              );
            }, separatorBuilder: (_, int index) => const SizedBox(height: 8),
          ),
        ),
      ],
    );
  }
}