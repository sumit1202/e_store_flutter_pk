import 'package:flutter/material.dart';
import 'package:flutter_pk/models/catalog_model.dart';

class HomeDetailsPage extends StatelessWidget {
  final CatalogModel catalog;
  const HomeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.network(catalog.image),
            const Spacer(
              flex: 1,
            ),
            Text(
              catalog.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(catalog.desc),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\$${catalog.price.toString()}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
