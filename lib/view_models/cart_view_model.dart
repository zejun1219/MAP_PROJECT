import 'package:flutter/material.dart';
import 'package:template01/models/dishes.dart';
import 'package:template01/models/shopping_cart.dart';
import 'package:template01/models/user.dart';
import 'package:template01/services/firestore.dart';


class ShoppingCartViewModel extends ChangeNotifier {
  final FirestoreService firestoreService = FirestoreService();
  Users? _currentUser;
  List<ShoppingCartItem> _cartItems = [];
  bool _isLoading = false;

  List<ShoppingCartItem> get cartItems => _cartItems;
  bool get isLoading => _isLoading;

  ShoppingCartViewModel(Users currentUser) {
    _currentUser = currentUser;
    fetchCartItems(_currentUser!.username);
  }

  void fetchCartItems(String username) {
    _isLoading = true;
    notifyListeners();

    firestoreService.getShoppingCartItems(username).listen((itemsData) {
      _cartItems = itemsData;
      _isLoading = false;
      notifyListeners();
    });
  }
//~ add dishes into shopping cart
  Future<void> addCartItem(ShoppingCartItem cartItem) async {
  await firestoreService.addCartItem(cartItem);
  fetchCartItems(_currentUser!.username); // 更新购物车列表
  notifyListeners(); // 通知 View 层数据的变化
}

  //~ get shopping carts
    Stream<List<ShoppingCartItem>> getShoppingCartItems(String username) {
    return firestoreService.getShoppingCartItems(username);
  }
  //~ add selected dishes into shopping cart
  Future<void> addToCart(BuildContext context, Dishes dish, Users user) async {
  await firestoreService.addToCart(context, dish, user);
  fetchCartItems(_currentUser!.username); // 更新购物车列表
  notifyListeners(); // 通知 View 层数据的变化
}

  Future<void> updateCartItem(ShoppingCartItem item) async {
    try {
      await firestoreService.updateCartItem(item);
    } catch (e) {
      print('Error updating cart item: $e');
    }
  }

  Future<void> deleteCartItem(String id) async {
    try {
      await firestoreService.deleteCartItem(id);
    } catch (e) {
      print('Error deleting cart item: $e');
    }
  }

  Future<void> clearUserCart(String username) async {
    try {
      await firestoreService.deleteUserCartItems(username);
    } catch (e) {
      print('Error clearing user cart: $e');
    }
  }
}

class ShoppingCartService {
  getShoppingCartItems(String username) {}
}