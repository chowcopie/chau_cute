import 'package:demo_structure/data/enums/auth_status.dart';
import 'package:demo_structure/data/services/auth/auth_local_service.dart';
import 'package:demo_structure/data/services/auth/auth_remote_service.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepository {
  factory AuthRepository() => instance;

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

  Future<void> init() async {
    Logger().i('Initializing authentication...');
    // Fake loading
    await Future.delayed(const Duration(seconds: 3));
    authState.add(AuthStatus.unauthenticated);
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
