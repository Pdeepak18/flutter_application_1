import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    displayOneController.text = x.toString();
    displayTwoController.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      // onStateChange: _onStateChanged,
      // onExitRequested: _onExitRequested,
    );
  }

  void _onShow() => print("onshow called");
  void _onHide() => print("onHide called");
  void _onResume() => print("onResume called");
  void _onDetach() => print("onDetach called");
  void _onInactive() => print("onInactive called");
  void _onPause() => print("onPause called");
  void _onRestart() => print("onRestart called");
  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    displayOneController.dispose();
    displayTwoController.dispose();
    _listener.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // Display
          DisplayCalc(
              hint: "Enter first number", controller: displayOneController),
          const SizedBox(
            height: 20.0,
          ),
          DisplayCalc(
              hint: "Enter second number", controller: displayTwoController),
          const SizedBox(
            height: 20.0,
          ),
          Text(z.toString(),
              style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                  onPressed: () => {
                        setState(() {
                          z = num.tryParse(displayOneController.text)! +
                              num.tryParse(displayTwoController.text)!;
                        })
                      },
                  child: const Icon(CupertinoIcons.add)),
              FloatingActionButton(
                  onPressed: () => {
                        setState(() {
                          z = num.tryParse(displayOneController.text)! -
                              num.tryParse(displayTwoController.text)!;
                        })
                      },
                  child: const Icon(CupertinoIcons.minus)),
              FloatingActionButton(
                  onPressed: () => {
                        setState(() {
                          z = num.tryParse(displayOneController.text)! *
                              num.tryParse(displayTwoController.text)!;
                        })
                      },
                  child: const Icon(CupertinoIcons.multiply)),
              FloatingActionButton(
                  onPressed: () => {
                        setState(() {
                          z = num.tryParse(displayOneController.text)! /
                              num.tryParse(displayTwoController.text)!;
                        })
                      },
                  child: const Icon(CupertinoIcons.divide)),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          FloatingActionButton.extended(
            onPressed: () => {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayOneController.clear();
                displayTwoController.clear();
              })
            },
            label: const Text("Clear"),
          )
          // expand
          // buttons
        ],
      ),
    );
  }
}

class DisplayCalc extends StatelessWidget {
  const DisplayCalc({
    super.key,
    this.hint = "Enter a number",
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 3.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 3.0),
              borderRadius: BorderRadius.circular(12)),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black,
          )),
    );
  }
}
