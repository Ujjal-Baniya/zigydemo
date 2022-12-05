import 'package:flutter/material.dart';
import 'package:zigydemo/Screens/Homepage.dart';
import 'package:zigydemo/Screens/get.dart';
import 'package:zigydemo/Screens/post.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      routes: {
        '/GetData': (context) => GetData(),
        '/PostData': (context) => PostData(),
      },
    );
  }
}
