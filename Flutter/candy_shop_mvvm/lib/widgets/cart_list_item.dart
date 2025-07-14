import 'package:candy_shop_mvvm/models/cart.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatefulWidget {
  final Cart cart;
  final Function add;
  final Function remove;
  const CartListItem({
    super.key,
    required this.cart,
    required this.add,
    required this.remove,
  });

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          SizedBox(width: 0),
          CircleAvatar(
            radius: 30,
            child: Text("${widget.cart.product.price.toStringAsFixed(1)}₺"),
          ),
          Text(widget.cart.product.title),
          Spacer(),
          IconButton(
            onPressed: () {
              setState(() {
                widget.remove();
              });
            },
            icon: Icon(Icons.remove),
          ),
          Text(widget.cart.quantity.toString()),
          IconButton(
            onPressed: () {
              setState(() {
                widget.add();
              });
            },
            icon: Icon(Icons.add),
          ),
          SizedBox(width: 0),
        ],
      ),
    );
  }
}
