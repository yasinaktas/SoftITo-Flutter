import 'package:vanilla_state_management/models/product.dart';

class Cart {
  final Product product;
  int quantity;

  Cart({required this.product, this.quantity = 1});
}
