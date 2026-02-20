import 'package:cubit_sample/core/widgets/my_button.dart';
import 'package:cubit_sample/core/widgets/my_text_field.dart';
import 'package:cubit_sample/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:cubit_sample/features/auth/presentation/views/phone_login.dart';
import 'package:cubit_sample/features/auth/presentation/widgets/container_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  final void Function() toggle;
  RegisterView({super.key, required this.toggle});

  //Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    void register() {
      final authCubit = context.read<AuthCubit>();
      authCubit.register(
        nameController.text,
        emailController.text,
        passController.text,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Register page')),
      body: SizedBox(
        child: Center(
          child: Column(
            children: [
              //name
              MyTextField(controller: nameController, hintText: 'Name'),
              //email
              MyTextField(controller: emailController, hintText: 'Email'),
              //pass
              MyTextField(
                controller: passController,
                hintText: 'Password',
                obscureText: false,
              ),
              MyButton(buttonName: 'Register', onTap: () => register()),
              SizedBox(height: 10),
              GestureDetector(onTap: toggle, child: Text('Login')),
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
