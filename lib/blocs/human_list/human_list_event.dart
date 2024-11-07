part of 'human_list_bloc.dart';

sealed class HumanListEvent extends Equatable {
  const HumanListEvent();

  @override
  List<Object> get props => [];
}

class FetchHumanList extends HumanListEvent {}

class SearchHumans extends HumanListEvent {
  final String query;

  const SearchHumans({required this.query});

  @override
  List<Object> get props => [query];
}


