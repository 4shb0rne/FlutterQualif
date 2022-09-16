import 'package:flutter/material.dart';
import 'package:qualif/models/globals.dart' as globals;
import 'package:qualif/views/pages/loginpage.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  AppState() {
    globals.currState = this;
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: globals.isDarkTheme ? globals.darkTheme : globals.lightTheme,
      home: LoginPage(),
    );
  }
}
