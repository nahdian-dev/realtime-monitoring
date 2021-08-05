import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:realtime_monitoring/config/configuration.dart';
import 'package:realtime_monitoring/views/user_access/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: white,
        bottomAppBarColor: Color(0xFFFFFFFF),
        appBarTheme: AppBarTheme(
          backgroundColor: primary,
        ),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
