import 'dart:developer';

import 'package:e_finder_app/auth_wrapper.dart';
import 'package:e_finder_app/views/screens/human_list/human_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/human_list/human_list_bloc.dart';
import 'blocs/login/login_bloc.dart';
import 'repositories/auth_repository.dart';
import 'repositories/human_repository.dart';
import 'views/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => HumanRepository()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => LoginBloc(context.read<AuthRepository>())),
        BlocProvider(create: (context) => HumanListBloc(context.read<HumanRepository>())),
      ],
      child: const MaterialApp(
        home: AuthenticationWrapper(),
      ),
    );
  }
}