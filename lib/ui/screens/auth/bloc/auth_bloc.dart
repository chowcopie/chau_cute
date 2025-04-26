import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:demo_structure/data/enums/auth_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitialState()) {
    on<AuthInitialEvent>(_onInitial);
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
  }

  _onInitial(AuthInitialEvent event, Emitter emit) async {
    await Future.delayed(const Duration(seconds: 2), () {
      emit(const AuthInitializedState(status: AuthStatus.authenticated));
    });
  }

  _onLogin(AuthLoginEvent event, Emitter emit) async {}

  _onLogout(AuthLogoutEvent event, Emitter emit) async {}
}
