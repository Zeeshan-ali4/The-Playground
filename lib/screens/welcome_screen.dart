import 'package:flutter/material.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Welcome Text with Line
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 2,
                  color: themeColor,
                  margin: EdgeInsets.only(right: 8),
                ),
                Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Text(
              'noavant',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: themeColor,
              ),
            ),
            SizedBox(height: 50),
            // Sign Up Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.routeName);
              },
              child: Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Log In Button
            ElevatedButton(
              onPressed: () {
                // Add Log In functionality
              },
              child: Text(
                'LOG IN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
