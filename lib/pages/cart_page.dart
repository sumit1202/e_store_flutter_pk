import 'package:flutter/material.dart';
import 'package:flutter_pk/models/cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              cartList.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: Icon(Icons.shopping_cart_outlined),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Image.network(cartList[index].image),
                            ),
                            title: Text(cartList[index].name),
                            subtitle: Text(
                              '\$${cartList[index].price.toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  cartList.remove(cartList[index]);
                                  totalAmount = sum();
                                  setState(() {});
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Removed Item from Cart.'),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.red,
                                )),
                          );
                        },
                      ),
                    ),
              const Divider(),
              ListTile(
                leading: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/4/4f/Dash%2C_the_mascot_of_the_Dart_programming_language.png'),
                title: const Text(
                  'Total Cart Value',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  '\$$totalAmount',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('\'Buy\' not supported yet.'),
                      ),
                    );
                  },
                  child: const Text(
                    'Buy',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
