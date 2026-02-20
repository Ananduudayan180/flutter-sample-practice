import 'package:cubit_sample/features/auth/presentation/views/login_view.dart';
import 'package:cubit_sample/features/auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';

class AuthRoute extends StatefulWidget {
  const AuthRoute({super.key});

  @override
  State<AuthRoute> createState() => _AuthRouteState();
}

class _AuthRouteState extends State<AuthRoute> {
  bool loginView = true;

  void toggleLogin() {
    setState(() {
      loginView = !loginView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loginView
        ? LoginView(toggle: toggleLogin)
        : RegisterView(toggle: toggleLogin);
  }
}
