import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pk/models/cart_model.dart';
import 'package:flutter_pk/models/catalog_model.dart';
import 'package:flutter_pk/utils/routes.dart';

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
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cartList.add(catalog);
          totalAmount = sum();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added Item to Cart.'),
            ),
          );
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: const Icon(CupertinoIcons.cart_badge_plus),
      ),
    );
  }
}
