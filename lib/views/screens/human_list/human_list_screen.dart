import 'dart:developer';

import 'package:e_finder_app/blocs/login/login_bloc.dart';
import 'package:e_finder_app/views/screens/human_list/human_list.dart';
import 'package:e_finder_app/views/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/human_list/human_list_bloc.dart';
import '../../../repositories/human_repository.dart';
import '../../widgets/no_data_found.dart';
import '../login/login_screen.dart';

class HumanListScreen extends StatelessWidget {
  const HumanListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HumanListBloc(
        context.read<HumanRepository>(),
      )..add(FetchHumanList()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.logout_outlined),
            )
          ],
        ),
        body: BlocBuilder<HumanListBloc, HumanListState>(
          builder: (context, state) {
            if (state is HumanListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HumanListLoaded) {
              if (state.humans.isEmpty) {
                return const NoDataWidget();
              }
              return HumanList(humans: state.humans);
            } else if (state is HumanListFailure) {
              return Center(child: MyErrorWidget(errorMessage: state.error));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
