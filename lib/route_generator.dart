import 'package:flutter/material.dart';
import 'package:rapup/pages/Start_Screen.dart';
import 'package:rapup/pages/edit_profile.dart';
import 'package:rapup/pages/friendProfile.dart';
import 'package:rapup/pages/home.dart';
import 'package:rapup/pages/map.dart';
import 'package:rapup/pages/sign_in.dart';
import 'package:rapup/pages/sign_up.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Start_Screen());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/friendProfile':
        return MaterialPageRoute(builder: (_) => FriendProfile());
      case '/map':
        return MaterialPageRoute(builder: (_) => MapScreen());
      case '/editProfile':
        return MaterialPageRoute(builder: (_) => EditProfile());

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