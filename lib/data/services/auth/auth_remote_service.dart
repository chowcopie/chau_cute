class AuthRemoteService {
  factory AuthRemoteService() => _instance;
  AuthRemoteService._();

  static final AuthRemoteService _instance = AuthRemoteService._();

  Future<void> loginWithCredentials() async {}

  Future<void> loginWithBiometrics() async {}

  Future<void> loginWithGoogle() async {}

  Future<void> loginWithApple() async {}

  Future<void> logout() async {}
}
