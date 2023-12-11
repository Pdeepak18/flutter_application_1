import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Learn",
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const HomePage());
  }
}
