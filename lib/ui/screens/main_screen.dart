import 'package:flutter/material.dart';
import 'package:flutter_12/business/functions.dart';
import 'package:get_it/get_it.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String result;
  late int _count = 0;

  @override
  void initState() {
    super.initState();
    result = GetIt.I.get<SimpleFunctions>().gText();
  }

  void _changeData() {
    setState(() {
      _count++;
      result = GetIt.I.get<SimpleFunctions>().gText(_count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework 12'),
      ),
      body: SafeArea(
        child: Center(
          child: Text(result ?? 'Default Text'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _changeData,
        label: const Text('Изменить Data'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
