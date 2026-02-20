import 'package:firebase_bloc_social_media/data/services/firebase_auth_service.dart';
import 'package:firebase_bloc_social_media/logic/auth/auth_cubit.dart';
import 'package:firebase_bloc_social_media/presentation/ui/auth/auth_route.dart';
import 'package:firebase_bloc_social_media/presentation/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthCubit(authRepo: FirebaseAuthService())..checkCurrentUser(),
      child: MaterialApp(
        home: BlocConsumer<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
            }
          },
          builder: (context, state) {
            if (state is AuthInitial) {
              return AuthRoute();
            } else if (state is AuthLoaded) {
              return ProfileScreen();
            } else {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ),
    );
  }
}
