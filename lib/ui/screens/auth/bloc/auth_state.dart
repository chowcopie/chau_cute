part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState({this.status = AuthStatus.checking});

  final AuthStatus status;

  AuthState copyWith({AuthStatus? status}) {
    return AuthState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
