import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karkarapp/models/products.dart';

class ShoppingCart with ChangeNotifier {
  final List<ProductInCart> _shoppingCart = [];
  void addToCart(Product product) {
    _shoppingCart.add(ProductInCart(product, 1));
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _shoppingCart.removeWhere((element) => element.item == product);
    notifyListeners();
  }

  void increment(Product product) {
    final indexProduct = _shoppingCart.where((element) => element.item.id == product.id);
    indexProduct.first.amount++;
    notifyListeners();
  }

  void decrement(Product product) {
    final indexProduct = _shoppingCart.where((element) => element.item.id == product.id);
    if(indexProduct.first.amount > 1){
      indexProduct.first.amount--;
    }
    notifyListeners();
  }


  List<ProductInCart> get cart => _shoppingCart;
  int getTotalIemById(int id){
    for(ProductInCart product in _shoppingCart){
      if(product.productId == id){
        return product.totalItem;
      }
    }
    return -1;
  }

  double get totalPrice =>
      cart.fold(0, (total, current) => total + (current.item.price*current.amount));
}

class ProductInCart {
  final Product product;
  int amount;

  ProductInCart(this.product, this.amount);

  set setAmount(int newAmount) {
    amount = newAmount;
  }

  Product get item => product;
  int get totalItem => amount;
  int get productId => product.id;

   @override
  int get hashCode => product.id;

  @override
  bool operator == (Object other) =>
      other is ProductInCart && other.product == product;


  bool equals(Product product) {
    return product == this.product;
  }
  
}


