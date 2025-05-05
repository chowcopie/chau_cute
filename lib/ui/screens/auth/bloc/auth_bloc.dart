import 'package:bloc/bloc.dart';
import 'package:demo_structure/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

import 'package:demo_structure/data/enums/auth_status.dart';
import 'package:logger/logger.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthInitialEvent>(_onInitial);
    on<AuthChangeEvent>(_onChange);
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
  }

  _onInitial(AuthInitialEvent event, Emitter emit) {
    AuthRepository.instance.authState.listen((authState) {
      Logger().i('Authentication change $authState');
      add(AuthChangeEvent(status: authState));
    });
  }

  _onChange(AuthChangeEvent event, Emitter emit) {
    emit(state.copyWith(status: event.status));
  }

  _onLogin(AuthLoginEvent event, Emitter emit) async {
    await AuthRepository.instance.loginWithCredentials();
    // await AuthRepository.instance.loginWithBiometrics();
    // await AuthRepository.instance.loginWithGoogle();
    // await AuthRepository.instance.loginWithApple();
  }

  _onLogout(AuthLogoutEvent event, Emitter emit) async {
    await AuthRepository.instance.logout();
  }
}
