import 'package:cubit_sample/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    void logOut() {
      final authCubit = context.read<AuthCubit>();
      authCubit.logOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        actions: [
          IconButton(onPressed: () => logOut(), icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(child: Text('Home')),
    );
  }
}
