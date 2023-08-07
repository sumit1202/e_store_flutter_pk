import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pk/models/catalog_model.dart';
import 'package:flutter_pk/pages/home_details_page.dart';
import 'package:flutter_pk/utils/routes.dart';
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
      const Duration(seconds: 1),
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
        title: const Text('E-Store'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: catalogList.isNotEmpty
          ? listView()
          : const Center(
              child: CircularProgressIndicator(),
            ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: const Icon(CupertinoIcons.cart),
      ),
    );
  }

  ListView listView() {
    return ListView.builder(
      itemCount: catalogList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          color: Theme.of(context).cardColor,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomeDetailsPage(catalog: catalogList[index]),
                ),
              );
            },
            leading:
                CircleAvatar(child: Image.network(catalogList[index].image)),
            title: Text(
              catalogList[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            subtitle: Text(catalogList[index].desc),
            trailing: Text(
              "\$${catalogList[index].price.toString()}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    );
  }
}
