import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: FlashApp());
  }
}

class FlashApp extends StatefulWidget {
  const FlashApp({Key? key}) : super(key: key);

  @override
  State<FlashApp> createState() => _FlashAppState();
}

class _FlashAppState extends State<FlashApp> {
  bool isClicked = false;
  String text = 'OFF';
  final controller = TorchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: () {
            setState(() {
              controller.toggle();
              isClicked = !isClicked;
              if (isClicked) {
                text = 'ON';
                isClicked = true;
              } else {
                text = 'OFF';
                isClicked = false;
              }
            });
          },
          child: Center(
            child: SizedBox(
              child: Center(
                  child: Icon(
                Icons.power_settings_new,
                color: isClicked ? Colors.red : Colors.white,
                size: 120,
              )),
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 24, color: isClicked ? Colors.red : Colors.white),
        )
      ]),
    );
  }
}
