import 'package:flutter/material.dart';
import 'package:test_bnetfit/features/homscreen/homescreen.dart';
import 'package:test_bnetfit/features/homscreen/main_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        home: const MainTabView());
  }
}
