import 'dart:async';

import 'package:e_finder_app/models/human_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/human_repository.dart';

part 'human_list_event.dart';
part 'human_list_state.dart';

class HumanListBloc extends Bloc<HumanListEvent, HumanListState> {
  final HumanRepository _humanRepository;
  List<HumanModel> _allHumans = [];

  HumanListBloc(this._humanRepository) : super(HumanListInitial()) {
    on<FetchHumanList>(_fetchHumanList);
    on<SearchHumans>(_searchHuman);
  }

  Future<void> _fetchHumanList(FetchHumanList event, Emitter<HumanListState> emit) async {
    emit(HumanListLoading());
    try {
      _allHumans = await _humanRepository.getHumans() ??[];
      emit(HumanListLoaded(humans: _allHumans));
    } catch (e) {
      emit(HumanListFailure(error: e.toString()));
    }
  }

  Future<void> _searchHuman(SearchHumans event, Emitter<HumanListState> emit) async {
    emit(HumanListLoading());
    try {
      final filteredHumans = _allHumans.where((human) {
        return human.firstName.toLowerCase().contains(event.query.toLowerCase()) ||
            human.lastName.toLowerCase().contains(event.query.toLowerCase()) || human.id.toString().contains(event.query);
      }).toList();
      emit(HumanListLoaded(humans: filteredHumans));
    } catch (e) {
      emit(HumanListFailure(error: e.toString()));
    }
  }
}