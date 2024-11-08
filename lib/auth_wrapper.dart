import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_bloc.dart';
import 'views/screens/human_list/human_list_screen.dart';
import 'views/screens/login/login_screen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          // Trigger check auth status when app starts
          context.read<AuthBloc>().add(CheckAuthStatus());
          return const Center(child: CircularProgressIndicator());
        } else if (state is Authenticated) {
          return const HumanListScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}