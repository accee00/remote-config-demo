import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_config_demo/presentation/bloc/bloc/remote_config_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<RemoteConfigBloc>().add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote Config Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocBuilder<RemoteConfigBloc, RemoteConfigState>(
        builder: (context, state) {
          if (state is RemoteConfigDataFetch) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Remote Config Demo',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              body: Center(
                child: Text(
                  "Product Name: ${state.productName}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
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
