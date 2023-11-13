import 'package:core/core.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/auth_bloc.dart';
import 'auth_form.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext _) => AuthBloc(
        appRouter: appLocator<AppRouter>(),
        loginUseCase: appLocator<LoginUseCase>(),
      ),
      child: const AuthForm(),
    );
  }
}
