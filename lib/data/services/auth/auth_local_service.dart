class AuthLocalService {
  factory AuthLocalService() => _instance;
  AuthLocalService._();

  static final AuthLocalService _instance = AuthLocalService._();

  Future<void> saveToken(String token) async {}

  Future<String?> getToken() async {
    return '';
  }

  Future<void> saveUserAccount(Map<String, dynamic> userJson) async {}

  Future<Map<String, dynamic>?> getUserAccount() async {
    return {};
  }

  Future<void> clearAuthData() async {}
}
