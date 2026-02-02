import 'package:firebase_bloc_social_media/data/models/user_model.dart';
import 'package:firebase_bloc_social_media/logic/auth/auth_cubit.dart';
import 'package:firebase_bloc_social_media/presentation/widgets/custom_button.dart';
import 'package:firebase_bloc_social_media/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final void Function()? onTap;

  const RegisterScreen({super.key,required this.onTap});

  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  static final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //register
    void registerUser() {
      final authCubit = context.read<AuthCubit>();
      final user = UserModel(
        uid: null,
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      authCubit.registerUser(user);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(label: 'Name', controller: nameController),
              SizedBox(height: 10),
              MyTextField(label: 'Email', controller: emailController),
              SizedBox(height: 10),
              MyTextField(label: 'Password', controller: passwordController),
              SizedBox(height: 10),
              MyButton(
                buttonText: 'Register',
                onTap: () {
                  registerUser();
                },
              ),
              SizedBox(height: 50),
              GestureDetector(onTap: onTap, child: Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
