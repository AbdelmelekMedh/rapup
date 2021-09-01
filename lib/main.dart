import 'package:flutter/material.dart';
import 'package:rapup/route_generator.dart';
import 'package:rapup/services/shared_service.dart';

String path = '/';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool reslt = await SharedService.isloggedIn();
  if (reslt){
    path = '/home';
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rap Up IU',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      initialRoute: path,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

