import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/calculator/calculator_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: const Text(
          "Calculator App",
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: const CalculatorPage(),
      ),
    );
  }
}
