import 'package:flutter/material.dart';
import 'package:save_supermarket/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String market = "Save";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save Supermarket"),
      ),
      body: const Center(
        child: Text("Welcome to $market Supermarket"),
      ),
      drawer: const MyDrawer(),
    );
  }
}
