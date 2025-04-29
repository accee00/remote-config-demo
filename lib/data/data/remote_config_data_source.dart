import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

abstract class RemoteConfigDataSource {
  Future<void> initialize(Map<String, dynamic> map);
  String getStringValue(String key);
}

class RemoteConfigDataSourceImpl extends RemoteConfigDataSource {
  final FirebaseRemoteConfig remoteConfig;
  RemoteConfigDataSourceImpl({required this.remoteConfig});

  @override
  Future<void> initialize(Map<String, dynamic> map) async {
    try {
      await remoteConfig.ensureInitialized();
      await remoteConfig.setDefaults(map);
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: Duration(seconds: 1),
          minimumFetchInterval: Duration(seconds: 10),
        ),
      );
      await remoteConfig.fetchAndActivate();

      debugPrint("Last fetch status: ${remoteConfig.lastFetchStatus}");
      debugPrint("Last fetch time: ${remoteConfig.lastFetchTime}");
      debugPrint("New fetch value: ${remoteConfig.getString('product')}");
    } catch (e, stack) {
      debugPrint("Remote Config Error: $e");
      debugPrint(stack.toString());
      rethrow;
    }
  }

  @override
  String getStringValue(String key) {
    return remoteConfig.getString(key);
  }
}
