import 'package:candy_shop_mvvm/cart_view_model.dart';
import 'package:candy_shop_mvvm/cart_view_model_provider.dart';
import 'package:candy_shop_mvvm/models/product.dart';
import 'package:candy_shop_mvvm/pages/cart_page.dart';
import 'package:candy_shop_mvvm/widgets/product_list_item.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<Product> products = [
    Product(
      title: 'Product 1',
      description: 'Description 1',
      price: 29.99,
      id: '1',
    ),
    Product(
      title: 'Product 2',
      description: 'Description 2',
      price: 19.99,
      id: '2',
    ),
    Product(
      title: 'Product 3',
      description: 'Description 3',
      price: 39.99,
      id: '3',
    ),
    Product(
      title: 'Product 4',
      description: 'Description 4',
      price: 49.99,
      id: '4',
    ),
  ];

  late final CartViewModel _cartViewModel;
  @override
  void initState() {
    super.initState();
    _cartViewModel = CartViewModelProvider.read(context);
    _cartViewModel.addListener(_onCartViewModelStateChanged);
  }

  @override
  void dispose() {
    _cartViewModel.removeListener(_onCartViewModelStateChanged);
    super.dispose();
  }

  void _onCartViewModelStateChanged() {
    if (_cartViewModel.state.error != null) {
      _cartViewModel.clearError();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${_cartViewModel.state.error!.toString()}'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _cartViewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Products'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(color: Colors.grey.shade300),
            ),
            actions: [
              if (_cartViewModel.state.isLoading)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            child: Text(
              _cartViewModel.state.totalItems.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductListItem(product: products[index]);
            },
          ),
        );
      },
    );
  }
}
