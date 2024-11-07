part of 'human_list_bloc.dart';

sealed class HumanListState extends Equatable {
  const HumanListState();
  
  @override
  List<Object> get props => [];
}

final class HumanListInitial extends HumanListState {}

class HumanListLoading extends HumanListState {}

class HumanListLoaded extends HumanListState {
  final List<HumanModel> humans;

  const HumanListLoaded({required this.humans});

  @override
  List<Object> get props => [humans];
}

class HumanListFailure extends HumanListState {
  final String error;

  const HumanListFailure({required this.error});

   @override
  List<Object> get props => [error];
}

