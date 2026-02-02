import 'package:firebase_bloc_social_media/logic/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void logOutUser() {
      final authService = context.read<AuthCubit>();
      authService.logOut();
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logOutUser();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('Home profile')),
    );
  }
}
