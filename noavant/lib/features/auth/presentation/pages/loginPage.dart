import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noavant/features/auth/presentation/components/my_text_field.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  // Login action
  void login() {
    final String email = emailController.text;
    final String pw = pwController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty && pw.isNotEmpty) {
      authCubit.login(email, pw);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Please enter your email and password"),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Fetch theme for consistent usage

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          'noavant',
          style: theme.textTheme.displayLarge?.copyWith(
            color: theme.colorScheme.primary, // Primary color from theme
            fontWeight: FontWeight.bold,
          ), // Use title text styling
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
                  CupertinoIcons.group_solid,
                  size: 80,
                  color: theme.colorScheme.primary, // Primary color from theme
                ),
              ),
              // const SizedBox(height: 10),

              // Headline
              Text(
                "Welcome Back",
                textAlign: TextAlign.center,
                style: theme.textTheme.displayMedium, // Use theme typography
              ),
              const SizedBox(height: 8),

              // Subtext
              Text(
                "Sign in to continue your fashion journey.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium, // Use body text styling
              ),
              const SizedBox(height: 40),

              // Email Input Field
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                fillColor: theme.inputDecorationTheme.fillColor, // Theme color
              ),
              const SizedBox(height: 16),

              // Password Input Field
              MyTextField(
                controller: pwController,
                hintText: 'Password',
                obscureText: true,
                fillColor: theme.inputDecorationTheme.fillColor, // Theme color
              ),
              const SizedBox(height: 32),

              // Login Button
              ElevatedButton(
                onPressed: login,
                style: theme.elevatedButtonTheme.style, // Use themed button style
                child: const Text(
                  'Log In',
                ),
              ),
              const SizedBox(height: 16),

              // Register Link
              GestureDetector(
                onTap: widget.togglePages,
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Don’t have an account? ",
                      style: theme.textTheme.bodyMedium, // Use body text style
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                            color: theme.colorScheme.primary, // Primary color
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
