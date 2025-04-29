abstract class RemoteConfigRepo {
  Future<void> initialize();
  Future<String> getStringValue(String key);
}
