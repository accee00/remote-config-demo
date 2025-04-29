// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:remote_config_demo/data/data/remote_config_data_source.dart';
import 'package:remote_config_demo/domain/repository/remote_config_repo.dart';

class RemoteConfigRepoimpl extends RemoteConfigRepo {
  final RemoteConfigDataSource remoteConfigDataSource;
  RemoteConfigRepoimpl({required this.remoteConfigDataSource});
  @override
  Future<String> getStringValue(String key) async {
    return remoteConfigDataSource.getStringValue(key);
  }

  @override
  Future<void> initialize(Map<String, dynamic> map) async {
    return remoteConfigDataSource.initialize(map);
  }
}
