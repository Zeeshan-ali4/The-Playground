import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noavant/design_elements/components/my_text_field.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_cubit.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;

  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  // Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();

  // Register action
  void register() {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String pw = pwController.text;
    final String confirmPw = confirmPwController.text;

    final authCubit = context.read<AuthCubit>();

    if (name.isNotEmpty && email.isNotEmpty && pw.isNotEmpty && confirmPw.isNotEmpty) {
      if (pw == confirmPw) {
        authCubit.register(email, pw, name);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Passwords don't match!"),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please fill in all fields!"),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          'noavant',
          style: theme.textTheme.displayLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo/Icon
              Center(
                child: Icon(
                  CupertinoIcons.person_crop_circle_badge_plus,
                  size: 80,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),

              // Headline
              Text(
                "Create Your Account",
                textAlign: TextAlign.center,
                style: theme.textTheme.displayMedium,
              ),
              const SizedBox(height: 8),

              // Subtext
              Text(
                "Join us and begin your fashion journey.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 40),

              // Name Input Field
              MyTextField(
                controller: nameController,
                hintText: 'Name',
                obscureText: false,
                fillColor: theme.inputDecorationTheme.fillColor,
              ),
              const SizedBox(height: 16),

              // Email Input Field
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                fillColor: theme.inputDecorationTheme.fillColor,
              ),
              const SizedBox(height: 16),

              // Password Input Field
              MyTextField(
                controller: pwController,
                hintText: 'Password',
                obscureText: true,
                fillColor: theme.inputDecorationTheme.fillColor,
              ),
              const SizedBox(height: 16),

              // Confirm Password Input Field
              MyTextField(
                controller: confirmPwController,
                hintText: 'Confirm Password',
                obscureText: true,
                fillColor: theme.inputDecorationTheme.fillColor,
              ),
              const SizedBox(height: 32),

              // Register Button
              ElevatedButton(
                onPressed: register,
                style: theme.elevatedButtonTheme.style,
                child: const Text('Register'),
              ),
              const SizedBox(height: 16),

              // Login Link
              GestureDetector(
                onTap: widget.togglePages,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: theme.textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
