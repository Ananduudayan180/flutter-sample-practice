import 'package:cubit_sample/config/firebase_options.dart';
import 'package:cubit_sample/features/auth/data/repository/auth_repo.dart';
import 'package:cubit_sample/features/auth/data/services/auth_service.dart';
import 'package:cubit_sample/features/auth/data/services/gmail_auth_service.dart';
import 'package:cubit_sample/features/auth/data/services/phone_auth_service.dart';
import 'package:cubit_sample/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cubit_sample/features/auth/presentation/views/auth_route.dart';
import 'package:cubit_sample/features/auth/presentation/views/phone_login.dart';
import 'package:cubit_sample/features/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CheckStatus());
  }
}

class CheckStatus extends StatelessWidget {
  CheckStatus({super.key});
  //Repo instance

  final AuthRepo authRepo = AuthRepositoryImpl(
    gmailService: FirebaseGmailAuth(),
    phoneService: FirebasePhoneAuth(),
  );
  @override
  Widget build(BuildContext context) {
    //bloc provider
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkLoginStatus(),
      //bloc consumer
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
        },
        //bloc builder
        builder: (context, state) {
          if (state is AuthInitial) {
            return PhoneLogin();
          }
          if (state is AuthLoading) {
            return Scaffold(body: CircularProgressIndicator());
          }
          if (state is AuthLoaded) {
            return HomeView();
          } else {
            return AuthRoute();
          }
        },
      ),
    );
  }
}
