import 'package:flutter/material.dart';
import 'pages/note_page.dart';
import 'pages/main_page.dart';

void main() => runApp(MaterialAppScreen());

class MaterialAppScreen extends StatefulWidget {
  const MaterialAppScreen({Key? key}) : super(key: key);

  @override
  _MaterialAppScreenState createState() => _MaterialAppScreenState();
}

class _MaterialAppScreenState extends State<MaterialAppScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              color: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0.0),
          fontFamily: 'GothamPro'),
    );
  }
}