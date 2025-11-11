// lib/main.dart

import 'package:flutter/material.dart';
// Ensure this import matches your project name!
import 'package:simple_belfort_app/screens/home_screen.dart';

void main() {
  runApp(const SimpleBelfortApp());
}

class SimpleBelfortApp extends StatelessWidget {
  const SimpleBelfortApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Belfort App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          centerTitle: true, // bar title centered
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}