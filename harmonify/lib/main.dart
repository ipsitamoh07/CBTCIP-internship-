import 'package:flutter/material.dart';
import 'package:harmonify/views/home.dart';

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
      home: const Home(),
      title: 'Harmonify',
      theme: ThemeData(
        fontFamily: "MigaeSemibold-3zd2M",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}

    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.