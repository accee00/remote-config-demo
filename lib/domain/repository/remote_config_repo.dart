abstract class RemoteConfigRepo {
  Future<void> initialize(Map<String, dynamic> map);
  Future<String> getStringValue(String key);
}
