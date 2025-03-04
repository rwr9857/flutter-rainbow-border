import 'package:flutter/material.dart';
import 'package:flutter_rainbow_border/flutter_rainbow_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rainbow Border Container',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rainbow Border Container'),
      ),
      body: const Center(
        child: RainbowBorder(
              width: 300,
              height: 300,
              border: 4,
              borderRadius: 10,
              child: Text(
                "Rainbow Border",
                style: TextStyle(fontSize: 24),
              ),
            )
      ),
    );
  }
}
