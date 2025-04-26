part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialEvent extends AuthEvent {
  const AuthInitialEvent();
}

class AuthLoginEvent extends AuthEvent {
  const AuthLoginEvent({required this.userName, required this.passWord});

  final String userName;
  final String passWord;
}

class AuthLogoutEvent extends AuthEvent {
  const AuthLogoutEvent();
}
