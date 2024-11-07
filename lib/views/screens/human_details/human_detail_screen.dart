import 'package:e_finder_app/views/widgets/error_widget.dart';
import 'package:e_finder_app/views/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/human_details/human_details_bloc.dart';
import '../../../repositories/human_repository.dart';
import 'human_details.dart';

class HumanDetailScreen extends StatelessWidget {
  final int id;

  const HumanDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HumanDetailsBloc(context.read<HumanRepository>())..add(FetchHumanDetails(id)),
      child: Scaffold(
        appBar: AppBar(title: Text("See Details"),),
        body: BlocBuilder<HumanDetailsBloc, HumanDetailsState>(
          builder: (context, state) {
            if (state is HumanDetailsLoading) {
              return const LoadingIndicator();
            } else if (state is HumanDetailsLoaded) {
              return HumanDetails(human: state.human);
            } else if (state is HumanDetailsFailure) {
              return MyErrorWidget(errorMessage: state.error);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}