import 'package:flutter/material.dart';
import 'package:githubissuebrowser/screens/issue_screen.dart';
import 'package:githubissuebrowser/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id : (context) => MainScreen(),
        IssueScreen.id:(context) => IssueScreen(),
      },
    );

  }
}


