import 'package:remote_config_demo/domain/repository/remote_config_repo.dart';

class Intialise {
  final RemoteConfigRepo _repository;

  Intialise(this._repository);

  Future<void> call() async {
    return _repository.initialize();
  }
}
