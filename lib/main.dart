import 'package:flutter/material.dart';
import 'package:flutter_12/service_provider.dart';
import 'package:flutter_12/ui/screens/main_screen.dart';

void main() {
  initializeServices();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homework 12',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const MainScreen(),
      },
    );
  }
}