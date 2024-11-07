// LoginScreen.dart
import 'package:e_finder_app/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/login/login_bloc.dart';
import '../human_list/human_list_screen.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(context.read<AuthRepository>()),
      child: Scaffold(
        appBar: AppBar(title: Text('Login Here')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: ${state.error}'),
                  ),
                );
              } else if (state is LoginSuccess) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => HumanListScreen()),
                );
              }
            },
            builder: (context, state) {
              return LoginForm(
                isLoading: state is LoginLoading,
              );
            },
          ),
        ),
      ),
    );
  }
}