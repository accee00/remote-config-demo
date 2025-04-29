import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:remote_config_demo/domain/usecase/get_val_usecase.dart';
import 'package:remote_config_demo/domain/usecase/intialise.dart';

part 'remote_config_event.dart';
part 'remote_config_state.dart';

class RemoteConfigBloc extends Bloc<RemoteConfigEvent, RemoteConfigState> {
  final GetStringValueUseCase getStringValueUseCase;
  final Intialise intialise;
  RemoteConfigBloc(this.getStringValueUseCase, this.intialise)
    : super(RemoteConfigInitial()) {
    on<GetData>((event, emit) async {
      await intialise.call();
      emit(RemoteConfigLoading());
      try {
        final res = await getStringValueUseCase.call('product');
        emit(RemoteConfigDataFetch(data: res));
      } catch (e) {
        emit(RemoteConfigError('Failed to fetch data'));
      }
    });
  }
}
