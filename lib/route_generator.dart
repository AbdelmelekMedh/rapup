import 'package:flutter/material.dart';
import 'file:///C:/Users/anasm/AndroidStudioProjects/rapup/lib/pages/Start_Screen.dart';
import 'file:///C:/Users/anasm/AndroidStudioProjects/rapup/lib/pages/home.dart';
import 'file:///C:/Users/anasm/AndroidStudioProjects/rapup/lib/pages/sign_in.dart';
import 'file:///C:/Users/anasm/AndroidStudioProjects/rapup/lib/pages/sign_up.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Start_Screen());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());

      default:
        return _errorRoute();
    }

  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}