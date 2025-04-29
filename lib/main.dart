import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remote_config_demo/core/di/di.dart';
import 'package:remote_config_demo/firebase_options.dart';
import 'package:remote_config_demo/presentation/app.dart';
import 'package:remote_config_demo/presentation/bloc/bloc/remote_config_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<RemoteConfigBloc>()..add(GetData())),
      ],
      child: MyApp(),
    ),
  );
}
