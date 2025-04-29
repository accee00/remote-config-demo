import 'package:remote_config_demo/domain/repository/remote_config_repo.dart';

class GetStringValueUseCase {
  final RemoteConfigRepo _repository;

  GetStringValueUseCase(this._repository);

  Future<String> call(String key) async {
    return _repository.getStringValue(key);
  }
}
