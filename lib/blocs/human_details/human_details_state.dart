part of 'human_details_bloc.dart';

sealed class HumanDetailsState extends Equatable {
  const HumanDetailsState();
  
  @override
  List<Object> get props => [];
}

final class HumanDetailsInitial extends HumanDetailsState {}

class HumanDetailsLoading extends HumanDetailsState {}

class HumanDetailsLoaded extends HumanDetailsState {
  final HumanModel human;

  const HumanDetailsLoaded({required this.human});

  @override
  List<Object> get props => [human];
}

class HumanDetailsFailure extends HumanDetailsState {
  final String error;

  const HumanDetailsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
