import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../utils/user_session.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSession _userSession = UserSession();

  AuthBloc() : super(AuthInitial()) {
    on<CheckAuthStatus>(_checkAuthStatus);
    on<LoggedIn>(_loggedIn);
    on<LoggedOut>(_loggedOut);
  }

  Future<void> _checkAuthStatus(CheckAuthStatus event, Emitter<AuthState> emit) async {
    final isLoggedIn = await _userSession.isUserLoggedIn();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  void _loggedIn(LoggedIn event, Emitter<AuthState> emit) {
    emit(Authenticated());
  }

  void _loggedOut(LoggedOut event, Emitter<AuthState> emit) {
    emit(Unauthenticated());
  }
}
