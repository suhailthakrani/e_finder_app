part of 'human_details_bloc.dart';

sealed class HumanDetailsEvent extends Equatable {
  const HumanDetailsEvent();

  @override
  List<Object> get props => [];
}

class FetchHumanDetails extends HumanDetailsEvent {
  final int humanId;

  const FetchHumanDetails(this.humanId);

  @override
  List<Object> get props => [humanId];
}