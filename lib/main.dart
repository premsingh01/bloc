import 'package:bloc_study/bloc/counter/counter_bloc.dart';
import 'package:bloc_study/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_study/bloc/switch/switch_bloc.dart';
import 'package:bloc_study/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:((context) => SwitchBloc())
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Dashboard(),
      ),
    );
  }
}