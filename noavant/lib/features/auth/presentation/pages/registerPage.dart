

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noavant/features/auth/presentation/components/my_button.dart';
import 'package:noavant/features/auth/presentation/components/my_text_field.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget{
  final void Function()? togglePages;

  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  // Text editing controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();

  // Register function
  void register() {

    // prepare info
    final String name = nameController.text;
    final String email = emailController.text.trim();
    final String pw = pwController.text;
    final String confirmPw = confirmPwController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // check if fields aren't empty
    if (email.isNotEmpty &&
        name.isNotEmpty &&
        pw.isNotEmpty &&
        confirmPw.isNotEmpty) {

          // check if passwords match
          if (pw == confirmPw) {
            authCubit.register(email, pw, name);
          }

          // passwords dont match -> show error message
          else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Passwords don't match!")));
          }
        }

    // fields are empty -> show error message
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields!")));
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    pwController.dispose();
    confirmPwController.dispose();
    super.dispose();
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    // Scaffold
    return Scaffold(
      // Appbar
      appBar: AppBar(
        title: Text("noavant"),
      ),

      // Body
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [
            
                // Logo for the app
                Icon(Icons.lock_open_rounded, size:80,
                  color:  Theme.of(context).colorScheme.primary,
                ),
            
                // Create account message 
                Text(
                  "Let's create an account for you!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 25),

                // name textfield
            
                MyTextField(
                  controller: nameController,
                  hintText: 'Name',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
            
                // email textfield
            
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),
            
                // password textfield

                MyTextField(
                  controller: pwController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // Confirm password textfield

                MyTextField(
                  controller: confirmPwController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),
            
                // Register button
                MyButton(
                  onTap: register, 
                  text: 'Register',
                ),

                const SizedBox(height: 10),
            
                // Already a member? Login now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a member?",
                      style:
                      TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        " Login now!",
                        style:
                        TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}