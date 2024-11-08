part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class CheckAuthStatus extends AuthEvent {}
final class LoggedIn extends AuthEvent {}
final class LoggedOut extends AuthEvent {}
