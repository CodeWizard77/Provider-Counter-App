import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/Counter/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 2), (timer) {
      countProvider.setCount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    //final countProvider = Provider.of<CountProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Count Example"),
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (context, value, child) {
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 40.0),
          );
        }),
      ),
      floatingActionButton: Consumer<CountProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              value.setCount();
            },
          );
        },
      ),
    );
  }
}
