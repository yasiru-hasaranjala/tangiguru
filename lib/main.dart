import 'package:app/main_menu/automatic_control.dart';
import 'package:app/main_menu/user_control.dart';
import 'package:app/user_control/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'main_menu/main_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff57A632),
        primarySwatch: Colors.green,
        fontFamily: 'Georgia',
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 25.0, fontFamily: 'Hind'),
          bodyText2: TextStyle(fontSize: 12.0, fontFamily: 'Hind'),
        ),
      ),
      home: WillPopScope(
        onWillPop: () async => false,
        child: const MainMenu(),
      )
    );
  }


}