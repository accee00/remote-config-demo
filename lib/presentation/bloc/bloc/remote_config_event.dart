part of 'remote_config_bloc.dart';

@immutable
sealed class RemoteConfigEvent {}

class GetData extends RemoteConfigEvent {}
