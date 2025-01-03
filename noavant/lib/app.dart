import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noavant/features/auth/data/SupabaseAuthRepo.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_states.dart';
import 'package:noavant/features/auth/presentation/pages/auth_page.dart';
import 'package:noavant/features/home/home_page.dart';
import 'package:noavant/design_elements/themes/light_mode.dart';
import 'package:noavant/features/profile/profile_cubit.dart';
import 'package:noavant/features/profile/profile_repo.dart';
import 'package:noavant/features/profile/supabase_profile_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

/*

APP - Root level

Repositories: for the database
  - supabase

Bloc providers: for state management
  - auth

Check Auth State
  - unauthenticated -> Auth Page (login & register)
  - authenticated -> Home Page

*/

final supbaseClient = supabase.Supabase.instance.client;

class MyApp extends StatelessWidget {
  // auth repo
  final authRepo = SupabaseAuthRepo();

  // profile repo
  final profileRepo = SupabaseProfileRepo(
    supabaseClient: supbaseClient,
  );

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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            // Check auth state
            print(authState);

            // Unauthenticated -> Auth Page (login & register)
            if (authState is Unauthenticated) {
              return const AuthPage();
            }

            // Authenticated -> Home Page
            if (authState is Authenticated) {
              return const HomePage();
            }

            // Loading
            else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          // Listener for errors
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ),
    );
  }
}
