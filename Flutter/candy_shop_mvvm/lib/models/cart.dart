import 'package:candy_shop_mvvm/models/product.dart';

class Cart {
  final Product product;
  int quantity;

  Cart({required this.product, this.quantity = 1});
}
