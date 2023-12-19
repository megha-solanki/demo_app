import 'package:demo_app/bloc/app_bloc.dart';
import 'package:demo_app/repository/repository.dart';
import 'package:demo_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) =>
              UserBloc(UseRepository())..add(LoadUserEvent()),
        ),
      ], child: const HomePage()),
    );
  }
}
