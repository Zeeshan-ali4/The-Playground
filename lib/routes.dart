import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/registration_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  RegistrationScreen.routeName: (context) => RegistrationScreen(),
};
