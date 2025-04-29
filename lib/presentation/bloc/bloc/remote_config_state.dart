// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'remote_config_bloc.dart';

@immutable
sealed class RemoteConfigState {}

class RemoteConfigInitial extends RemoteConfigState {}

class RemoteConfigDataFetch extends RemoteConfigState {
  final String data;
  RemoteConfigDataFetch({required this.data});
}

class RemoteConfigLoading extends RemoteConfigState {}

class RemoteConfigError extends RemoteConfigState {
  final String message;
  RemoteConfigError(this.message);
}
