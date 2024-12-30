import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_cubit.dart'; // Import this if you're using Cubit for state management

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Icon for the logout button
            tooltip: "Logout", // Tooltip when hovered (or long-pressed on mobile)
            onPressed: () {
              context.read<AuthCubit>().logout(); // Calls the logout function from the AuthCubit
            },
          ),
        ],
      ),

      // body
      body: const Center(
        child: Text("Welcome to the Home Page!"),
      ),
    );
  }
}