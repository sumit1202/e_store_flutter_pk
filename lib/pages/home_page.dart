import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pk/models/catalog_model.dart';
import 'package:flutter_pk/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CatalogModel> list = [];

  @override
  void initState() {
    super.initState();
    loadMyJsonData();
  }

  loadMyJsonData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    final catalogDecodedJson = jsonDecode(catalogJson);
    var catalogProductsData = catalogDecodedJson['products'];
    list = List.from(catalogProductsData)
        .map<CatalogModel>((e) => CatalogModel.fromMap(e))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: list.isNotEmpty
          ? ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(list[index].image),
                    title: Text(list[index].name),
                    subtitle: Text(list[index].desc),
                    trailing: Text("\$${list[index].price.toString()}"),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const MyDrawer(),
    );
  }
}
