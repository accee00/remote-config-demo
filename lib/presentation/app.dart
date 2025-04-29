import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_config_demo/presentation/bloc/bloc/remote_config_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocBuilder<RemoteConfigBloc, RemoteConfigState>(
        builder: (context, state) {
          if (state is RemoteConfigDataFetch) {
            return Scaffold(
              appBar: AppBar(title: Text('Remote Config Demo')),
              body: Center(child: Text("Data-> ${state.data}")),
            );
          } else if (state is RemoteConfigInitial) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else {
            return Scaffold(body: Text('Error or unknown state'));
          }
        },
      ),
    );
  }
}
