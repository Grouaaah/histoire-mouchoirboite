import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatefulWidget {
const MyWidget({super.key});

@override
State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
@override
Widget build(BuildContext context) {
return const MaterialApp(
home: Scaffold(
appBar: AppBar(
title: Text("Asynconf 2024"),
),
body: const(
child: Text ("Bienvenue dans la FAQ des meilleurs mouchoirs 2024"),
)
)
);
}
}
