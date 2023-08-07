import 'package:flutter_pk/models/catalog_model.dart';

List<CatalogModel> cartList = [];

num totalAmount = sum();

num sum() {
  if (cartList.isNotEmpty) {
    num sum = 0;
    for (int i = 0; i < cartList.length; i++) {
      sum += cartList[i].price;
    }
    return sum;
  }
  return 0;
}
