/// Manages Persistent data
class LocalStorageService {
  static LocalStorageService get _instance => LocalStorageService._();
  factory LocalStorageService() => _instance;
  LocalStorageService get instance => _instance;

  LocalStorageService._();

  String? get accessToken => null;

  void saveAccessToken(String token){}

  static Future init() async {}
}
