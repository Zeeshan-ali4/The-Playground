// import 'package:flutter/material.dart';
// import 'loginPage.dart';
// import 'registerPage.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'noavant',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('noavant'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//         Text(
//           'Welcome to noavant',
//           style: TextStyle(fontSize: 24),
//         ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//            navigateToLoginPage(context);
//           },
//           child: Text('Login'),
//         ),
//         SizedBox(height: 10),
//         ElevatedButton(
//           onPressed: () {
//             navigateToRegisterPage(context);
//           },
//           child: Text('Register'),
//         ),
//           ],
//         ),
//       ),
//       );
//   }
// }
// void navigateToLoginPage(BuildContext context) {
//   Navigator.of(context).push(PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return FadeTransition(
//         opacity: animation,
//         child: child,
//       );
//     },
//   ));
// }

// void navigateToRegisterPage(BuildContext context) {
//   Navigator.of(context).push(PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => RegisterPage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return FadeTransition(
//         opacity: animation,
//         child: child,
//       );
//     },
//   ));
// }


