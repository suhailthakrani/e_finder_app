import 'dart:async';
import 'dart:convert';

import 'package:e_finder_app/models/user_model.dart';
import 'package:e_finder_app/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/user_session.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  LoginBloc(this._authRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onUserLogin);
    on<LogoutButtonPressed>(_onUserLogout);
  }

  Future<void> _onUserLogin(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      UserModel? userModel = await _authRepository.login(event.email, event.password);
      if(userModel != null) {
        // final prefs = await SharedPreferences.getInstance();
        // final userJson = jsonEncode(userModel.toJson());
        // await prefs.setString('token', userModel.token);
        // await prefs.setString('userModel', userJson);
        // await prefs.setBool('isLoggedIn', true);
        await UserSession().createSession(userData: userModel.toJson());
        await UserSession().saveToken(token: userModel.token);
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure(error: "Unable to login!"));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  Future<void> _onUserLogout(LogoutButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.remove('userModel');
      // await prefs.remove('token');
      // await prefs.setBool('isLoggedIn', false);
      // await _authRepository.login(event.email, event.password);
      await UserSession().createSession(userData: {});
      await UserSession().saveToken(token: "");
      emit(LoginInitial());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}


