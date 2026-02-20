import 'package:cubit_sample/core/widgets/my_button.dart';
import 'package:cubit_sample/core/widgets/my_text_field.dart';
import 'package:cubit_sample/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cubit_sample/features/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneLogin extends StatelessWidget {
  PhoneLogin({super.key});

  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }
      },
      builder: (context, state) {
        if (state is AuthInitial) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                MyTextField(
                  controller: phoneController,
                  hintText: 'Phone number',
                ),
                MyButton(
                  buttonName: 'Login',
                  onTap: () {
                    final authCubit = context.read<AuthCubit>();
                    authCubit.sendOtp(phoneController.text);
                  },
                ),
              ],
            ),
          );
        }
        if (state is AuthLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }  if (state is AuthLoaded) {
          return HomeView();
        } else {
          return Text('worng');
        }
      },
    );
  }
}
