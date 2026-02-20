import 'package:cubit_sample/core/widgets/my_button.dart';
import 'package:cubit_sample/core/widgets/my_text_field.dart';
import 'package:cubit_sample/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cubit_sample/features/auth/presentation/views/phone_login.dart';
import 'package:cubit_sample/features/auth/presentation/widgets/container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final void Function() toggle;
  LoginView({super.key, required this.toggle});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void login() {
      final authCubit = context.read<AuthCubit>();
      authCubit.login(emailController.text, passController.text);
    }

    return Scaffold(
      appBar: AppBar(title: Text('Login page')),
      body: SizedBox(
        child: Center(
          child: Column(
            children: [
              //email
              MyTextField(controller: emailController, hintText: 'Email'),
              //pass
              MyTextField(
                controller: passController,
                hintText: 'Password',
                obscureText: false,
              ),
              MyButton(buttonName: 'Login', onTap: () => login()),
              SizedBox(height: 10),
              GestureDetector(onTap: toggle, child: Text('Register')),

              //phone login
              ContainerButton(
                onTap: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => PhoneLogin())),
                buttonName: 'Phone Number',
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
