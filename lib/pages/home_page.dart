import 'package:flutter/material.dart';
import 'package:flutter_pk/models/catalog_model.dart';
import 'package:flutter_pk/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final list = [
    CatalogModel(
        id: 1,
        name: 'iphone 10',
        desc: 'Apple iphone 10',
        icon: Icons.phone_android),
    CatalogModel(
        id: 2,
        name: 'iphone 11',
        desc: 'Apple iphone 11',
        icon: Icons.phone_android),
    CatalogModel(
        id: 3,
        name: 'iphone 12',
        desc: 'Apple iphone 12',
        icon: Icons.phone_android),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(list[index].icon),
              title: Text(list[index].name),
              subtitle: Text(list[index].desc),
              trailing: Icon(Icons.monetization_on),
            ),
          );
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
