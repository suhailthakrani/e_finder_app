import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/human_model.dart';
import '../../repositories/human_repository.dart';

part 'human_details_event.dart';
part 'human_details_state.dart';

class HumanDetailsBloc extends Bloc<HumanDetailsEvent, HumanDetailsState> {
  final HumanRepository _humanRepository;

  HumanDetailsBloc(this._humanRepository) : super(HumanDetailsInitial()) {
    on<FetchHumanDetails>(_fetchHumanDetails);
  }

  Future<void> _fetchHumanDetails(FetchHumanDetails event, Emitter<HumanDetailsState> emit) async {
    emit(HumanDetailsLoading());
    try {
      final human = await _humanRepository.getHumanDetails(event.humanId);
      if (human != null) {
        emit(HumanDetailsLoaded(human: human));
      } else {
        emit(const HumanDetailsFailure(error: 'Human not found'));
      }
    } catch (e) {
      emit(HumanDetailsFailure(error: e.toString()));
    }
  }
}
