/*

Login Page

On this page, an existing user can enter their email and password to log in.

--------------------------------------------------------------------------------

Once the user successfully logs in, they will be redirected to home page

If user doesnt have an account yet, they can click on the register button 
and go to register page to create a new account.


*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noavant/features/auth/presentation/components/my_button.dart';
import 'package:noavant/features/auth/presentation/components/my_text_field.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;
  const LoginPage({super.key, required this.togglePages});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Text editing controllers
  final emailController = TextEditingController();
  final pwController = TextEditingController();

  // login button pressed
  void login() {

    // prepare email & pw
    final String email = emailController.text;
    final String pw = pwController.text;

    // auth cubit
    final authCubit = context.read<AuthCubit>();

    // ensure that the email & pw are not empty
    if (email.isNotEmpty && pw.isNotEmpty) {
      authCubit.login(email, pw);
    }

    // display error
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please enter your email and password"),
          backgroundColor: Colors.red[400],
        ),
      );
    }
  }

  @override
  void dispose () {
    emailController.dispose();
    pwController.dispose();
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
            
                // Welcome back message 
                Text(
                  "Welcome back! You've been missed!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 25),
            
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
            
                // login button
                MyButton(
                  onTap: login, 
                  text: 'Login',
                ),

                const SizedBox(height: 10),
            
                // register button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style:
                      TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    GestureDetector(
                      onTap: widget.togglePages,
                      child: Text(
                        " Register now!",
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

// import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:noavant/features/auth/presentation/cubits/auth_cubit.dart';
// // import 'package:noavant/features/auth/presentation/components/my_button.dart';
// // import 'package:noavant/features/auth/presentation/components/my_text_field.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'noavant',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: LoginPage(),
//     );
//   }
// }


// class LoginPage extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('noavant'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'noavant',
//               style: TextStyle(
//                 color: Colors.red,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _usernameController,
//               decoration: InputDecoration(
//                 labelText: 'Username',
//               ),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle login logic here
//                 String username = _usernameController.text;
//                 String password = _passwordController.text;
//                 print('Username: $username, Password: $password');
//               },
//               child: Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
