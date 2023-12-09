import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.pink,
        child: const Center(
            child: Text(
          "Hello World",
          style: TextStyle(
              fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    );
  }
}
