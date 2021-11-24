import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:marks_app/constants.dart';
import 'package:marks_app/models/note.dart';
import 'package:marks_app/pages/settings_page.dart';
import 'package:path_provider/path_provider.dart';
import 'pages/note_page.dart';
import 'pages/main_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(ColorAdapter());
  await Hive.openBox<Note>(HIVE_NOTE_BOX);
  runApp(MaterialAppScreen());
}

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
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/note_page': (BuildContext context) => NotePage(),
        '/settings_page': (BuildContext context) => SettingsPage(),
      },
    );
  }
}
