import 'package:flutter/material.dart';
import 'package:phonenumber/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode:ThemeMode.dark ,
      title: 'Sms Verification Whith Firebase',
      home: const HomePage(),
    );
  }
}


