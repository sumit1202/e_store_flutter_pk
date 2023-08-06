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
  List<CatalogModel> catalogList = [];

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
    catalogList = List.from(catalogProductsData)
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
      body: catalogList.isNotEmpty
          ? gridView()
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const MyDrawer(),
    );
  }

  GridView gridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: catalogList.length,
      itemBuilder: (context, index) {
        return Card(
          child: GridTile(
            header: Text(catalogList[index].desc),
            footer: Text("\$${catalogList[index].price.toString()}"),
            child: Image.network(catalogList[index].image),
          ),
        );
      },
    );
  }

  ListView listView() {
    return ListView.builder(
      itemCount: catalogList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.network(catalogList[index].image),
            title: Text(catalogList[index].name),
            subtitle: Text(catalogList[index].desc),
            trailing: Text("\$${catalogList[index].price.toString()}"),
          ),
        );
      },
    );
  }
}
