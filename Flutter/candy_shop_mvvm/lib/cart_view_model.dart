import 'package:candy_shop_mvvm/models/cart_state.dart';
import 'package:candy_shop_mvvm/models/cart.dart';
import 'package:candy_shop_mvvm/models/cart_model.dart';
import 'package:candy_shop_mvvm/models/product.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final CartModel _cartModel = CartModel();

  CartState _state = CartState(
    cart: {},
    totalPrice: 0,
    totalItems: 0,
  );

  CartState get state => _state;

  CartViewModel() {
    /*_cartModel.cartInfoStream.listen((cartInfo) {
      _cart.clear();
      _totalPrice = cartInfo.totalPrice;
      _totalItems = cartInfo.totalItems;
      cartInfo.cart.forEach((key, value) {
        _cart[key] = value;
      });
      notifyListeners();
    });*/
    _cartModel.cartInfoStream.listen((cartInfo){
      _state = _state.copyWith(
        cart:  cartInfo.cart,
        totalPrice: cartInfo.totalPrice,
        totalItems: cartInfo.totalItems,
      );
      notifyListeners();
    });
  }

  /*final Map<String, Cart> _cart = {};
  double _totalPrice = 0;
  int _totalItems = 0;

  List<Cart> get items => _cart.values.toList();
  double get totalPrice => _totalPrice;
  int get totalItems => _totalItems;*/

  /*void addToCart(Product product) {
    _cartModel.addToCart(product);
  }

  void removeFromCart(Cart cartItem) {
    _cartModel.removeFromCart(cartItem);
  }*/

  Future<void> addToCart(Product product) async{
    try{
      _state = _state.copyWith(isLoading: true);
      notifyListeners();
      await _cartModel.addToCart(product);
      _state = _state.copyWith(isLoading: false);
    }on Exception catch (e) {
      _state = _state.copyWith(isLoading: false, error: e);
    }
    notifyListeners();
  }

  Future<void> removeFromCart(Cart cartItem) async {
    try {
      _state = _state.copyWith(isLoading: true);
      notifyListeners();
      await _cartModel.removeFromCart(cartItem);
      _state = _state.copyWith(isLoading: false);
    } on Exception catch (e) {
      _state = _state.copyWith(isLoading: false, error: e);
    }
    notifyListeners();
  }

  void clearError(){
    _state = _state.copyWith(error: null);
    notifyListeners();
  }


  @override
  void dispose() {
    super.dispose();
    _cartModel.dispose();
  }
}
