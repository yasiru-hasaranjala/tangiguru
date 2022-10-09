import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String textValue = 'Hello World !';
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    var android = const AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = const IOSInitializationSettings();
    var platform = InitializationSettings(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.initialize(platform);

    // firebaseMessaging.getToken().then((token) {
    //   update(token!);
    // });
  }

  showNotification(Map<String, dynamic> msg) async {
    var android = const AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
    );
    var iOS = const IOSNotificationDetails();
    var platform = NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, "This is title", "this is demo", platform);
  }

  update(String token) {
    if (kDebugMode) {
      print(token);
    }
    DatabaseReference databaseReference = FirebaseDatabase().reference();
    databaseReference.child('fcm-token/$token').set({"token": token});
    textValue = token;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff2726A6),
        primarySwatch: Colors.blue,
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
        // child: const MainMenu(),
        child: LoginDemo(),
      )
    );
  }
}