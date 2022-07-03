import 'package:flutter/material.dart';
import 'package:youtube_ui/screens/home.dart';
import 'package:youtube_ui/screens/home_tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black)),
      home: const HomeTabs(),
    );
  }
}
