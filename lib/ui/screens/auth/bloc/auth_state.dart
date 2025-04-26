part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthInitializedState extends AuthState {
  const AuthInitializedState({required this.status});

  final AuthStatus status;
}
