import 'package:api_parsing_using_bloc/repos/repositories.dart';
import 'package:api_parsing_using_bloc/screens/home.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const HomePage(),
      ),
    );
  }
}
