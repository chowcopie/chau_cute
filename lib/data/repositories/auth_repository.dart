import 'dart:async';

import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import 'package:demo_structure/data/enums/auth_status.dart';
import 'package:demo_structure/data/services/auth/auth_local_service.dart';
import 'package:demo_structure/data/services/auth/auth_remote_service.dart';

class AuthRepository {
  AuthRepository._() {
    remoteService = AuthRemoteService();
    localService = AuthLocalService();

    authState = BehaviorSubject()..add(AuthStatus.checking);
  }

  static final AuthRepository instance = AuthRepository._();

  late final AuthRemoteService remoteService;
  late final AuthLocalService localService;

  /// Stream auth state
  late BehaviorSubject<AuthStatus> authState;

  /// Getter
  AuthStatus get authStatus => authState.value;
  bool get isLoggedIn => authStatus == AuthStatus.authenticated;

  Future<void> init() async {
    Logger().i('Initializing authentication...');
    // Fake loading
    await Future.delayed(const Duration(seconds: 3));
    authState.add(AuthStatus.unauthenticated);
  }

  Future<AuthStatus> getAuthStatus() async {
    if (authStatus != AuthStatus.checking) return authStatus;

    final Completer<AuthStatus> completer = Completer();

    final subs = authState.listen((value) {
      if (value != AuthStatus.checking) {
        completer.complete(value);
      }
    });

    final status = await completer.future;
    await subs.cancel();
    return status;
  }

  Future<void> loginWithCredentials() async {
    // Handle logic
    await remoteService.loginWithCredentials();

    // Change auth state if success
    authState.add(AuthStatus.authenticated);
  }

  Future<void> loginWithBiometrics() async {
    // Handle logic
    await remoteService.loginWithBiometrics();

    // Change auth state if success
    authState.add(AuthStatus.authenticated);
  }

  Future<void> loginWithGoogle() async {
    // Handle logic
    await remoteService.loginWithGoogle();

    // Change auth state if success
    authState.add(AuthStatus.authenticated);
  }

  Future<void> loginWithApple() async {
    // Handle logic
    await remoteService.loginWithApple();

    // Change auth state if success
    authState.add(AuthStatus.authenticated);
  }

  Future<void> logout() async {
    // Handle logic
    await remoteService.logout();

    // Change auth state if success
    authState.add(AuthStatus.unauthenticated);
  }
}
