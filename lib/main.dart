import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter project",
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutter project"),
        ),
        body: Text("안녕하세요....."),
      ),
    );
  }
}
