import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('PHL Shoe Stores'),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () {}),
        ],
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
