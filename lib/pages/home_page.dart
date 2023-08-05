import 'package:flutter/material.dart';
import 'package:flutter_pk/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = 'pk';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text('Learning Flutter in $days days by $name'),
      ),
      drawer: const MyDrawer(),
    );
  }
}
