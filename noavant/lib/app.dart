import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noavant/features/auth/data/firebase_auth_repo.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_states.dart';
import 'package:noavant/features/auth/presentation/pages/auth_page.dart';
import 'package:noavant/features/home/home_page.dart';
import 'package:noavant/features/profile/firebase_profile_repo.dart';
import 'package:noavant/features/profile/profile_cubit.dart';
import 'package:noavant/themes/light_mode.dart';

/*

APP - Root level

Repositories: for the database
  - firebase

Bloc providers: for state management
  - auth
  - profile
  - post
  - search
  - theme

Check Auth State
  - unauthhenticated -> Auth Page (login & register)
  - authenticated -> Home Page

*/


class MyApp extends StatelessWidget {

  // auth repo
  final authRepo = FirebaseAuthRepo();

  // profile repo
  final profileRepo = FirebaseProfileRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Providing cubit to our app
    return MultiBlocProvider(
      providers: [

        // auth cubit
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
        ),

        // profile cubit
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(profileRepo: profileRepo),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer <AuthCubit, AuthState> (
          builder: (context, authState) {
            // check auth state
            print(authState);

            // unauthhenticated -> Auth Page (login & register)
            if (authState is Unauthenticated) {
              return const AuthPage();
            }

            // authenticated -> Home Page
            if (authState is Authenticated) {
              return const HomePage();
            }

            // loading or any other state
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          // listener for errors
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text((state.message))));
            }
          },
        ),
      ),
    );
  }
}
