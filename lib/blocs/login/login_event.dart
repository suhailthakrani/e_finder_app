part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class LogoutButtonPressed extends LoginEvent {}

class SessionCheckRequested extends LoginEvent {}

