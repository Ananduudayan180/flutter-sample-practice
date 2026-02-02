import 'package:firebase_bloc_social_media/presentation/ui/auth/login_screen.dart';
import 'package:firebase_bloc_social_media/presentation/ui/auth/register_screen.dart';
import 'package:flutter/material.dart';

class AuthRoute extends StatefulWidget {
  const AuthRoute({super.key});

  @override
  State<AuthRoute> createState() => _AuthRouteState();
}

class _AuthRouteState extends State<AuthRoute> {
  bool isLogin = true;

  void isLoginPage() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginScreen(onTap: () => isLoginPage());
    } else {
      return RegisterScreen(onTap: () => isLoginPage());
    }
  }
}
