// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:template01/models/dishes.dart';
import 'package:template01/models/orders.dart';
import 'package:template01/models/shopping_cart.dart';
import 'package:template01/models/user.dart';
//*
//!
//?
//todo
//^
//~
//&
class FirestoreService {
  final CollectionReference dishes =
      FirebaseFirestore.instance.collection('dishes');
  final CollectionReference shoppingCartItems =
      FirebaseFirestore.instance.collection('shopping_cart');
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

//* =================== DISHES =========================
//todo --------------- Get Dishes ----------------------
  Stream<List<Dishes>> getDishes() {
    return dishes
        .orderBy('updateDate', descending: true) // 按照更新日期倒序排序
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        if (data is Map<String, dynamic>) {
          data['id'] = doc.id; // 将 Firebase 提供的 ID 存储到 'id' 字段中
          return Dishes.fromMap(data);
        } else {
          throw Exception('Document data is null');
        }
      }).toList();
    });
  }

  //todo ------------ Get Dishes By Name --------------
  Future<Dishes?> getDishByName(String name) async {
    var querySnapshot = await dishes.where('name', isEqualTo: name).get();
    if (querySnapshot.docs.isEmpty) {
      return null;
    } else {
      var doc = querySnapshot.docs.first;
      var data = doc.data();
      if (data is Map<String, dynamic>) {
        data['id'] = doc.id; // 将 Firebase 提供的 ID 存储到 'id' 字段中
        return Dishes.fromMap(data);
      } else {
        throw Exception('Document data is null');
      }
    }
  }

//todo --------------- Add Dishes ----------------------
  Future<void> addDish({
    required String name,
    required String type,
    required String description,
    required String image,
    required double price,
    required int quantity,
    required int size,
    required int salesVolume, // Add salesVolume parameter
    required bool memberPrice,
    required String imageUrl, // 新增的参数
    required bool soldOut, // 新增的参数
  }) {
    return dishes.add({
      'name': name,
      'type': type,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
      'size': size,
      'memberPrice': memberPrice,
      'imageUrl': imageUrl, // 新增的字段
      'salesVolume': salesVolume,
      'soldOut': soldOut,
      'createDate': Timestamp.now(),
      'updateDate': Timestamp.now(),
    });
  }

  //todo ---------- Delete Dishes ---------------------
  Future<void> deleteDish(String id) async {
    try {
      await dishes.doc(id).delete();
    } catch (e) {
      print('Error deleting dish: $e');
    }
  }

  //todo ---------- Update Dishes ---------------------
  Future<void> updateDish({
    required String id,
    required String name,
    required String type,
    required String description,
    required String image,
    required double price,
    required int quantity,
    required int size,
    required bool memberPrice,
    required String imageUrl, // 新增的参数
    required int salesVolume,
    required bool soldOut,
  }) async {
    await dishes.doc(id).update({
      'name': name,
      'type': type,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
      'size': size,
      'memberPrice': memberPrice,
      'imageUrl': imageUrl, // 新增的字段
      'salesVolume': salesVolume,
      'soldOut': soldOut,
      'updateDate': Timestamp.now(),
    });
  }


//* =============== Shopping Carts ======================
//todo ---------- Get Shopping Cart Items ---------------

  Stream<List<ShoppingCartItem>> getShoppingCartItems(String username) {
    return shoppingCartItems
        .where('username', isEqualTo: username) // 只查询当前用户的购物车项目
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        if (data is Map<String, dynamic>) {
          data['id'] = doc.id; // 将 Firebase 提供的 ID 存储到 'id' 字段中
          return ShoppingCartItem.fromMap(data);
        } else {
          throw Exception('Document data is null');
        }
      }).toList();
    });
  }

  //todo ---------- Add Shopping Cart Items ---------------
  Future<void> addCartItem(ShoppingCartItem cartItem) {
    return shoppingCartItems.add({
      'id': cartItem.id,
      'name': cartItem.name,
      'type': cartItem.type,
      'imageUrl': cartItem.imageUrl,
      'price': cartItem.price,
      'quantity': cartItem.quantity,
      'totalPrice': cartItem.total,
      'username': cartItem.username,
    });
  }

  //todo ---------- Update Shopping Cart Items ------------
  Future<void> updateCartItem(ShoppingCartItem cartItem) {
    return shoppingCartItems.doc(cartItem.id).update({
      'name': cartItem.name,
      'type': cartItem.type,
      'imageUrl': cartItem.imageUrl,
      'price': cartItem.price,
      'quantity': cartItem.quantity,
      'totalPrice': cartItem.total,
      'username': cartItem.username,
    });
  }

  //todo ----------- Delete Shopping Cart Item ------------
  Future<void> deleteCartItem(String id) async {
    try {
      await shoppingCartItems.doc(id).delete();
    } catch (e) {
      print('Error deleting shopping cart item: $e');
    }
  }

  //todo --------- Delete Shopping Cart By User -----------
  Future<void> deleteUserCartItems(String username) async {
    // 获取所有属于该用户的购物车项目
    QuerySnapshot querySnapshot =
        await shoppingCartItems.where('username', isEqualTo: username).get();

    // 删除每一个项目
    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }

//* ====================== Orders =========================
  //todo ----------------- Get Orders ---------------------
  Stream<List<Orders>> getOrders() {
    return orders
        .orderBy('update_date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Orders.fromSnapshot(doc);
      }).toList();
    });
  }

  //todo --------------- Create Order ---------------------
  Future<void> createOrder(Orders order) {
    return orders.add(order.toMap());
  }

  //todo ---------------- ADD Orders ----------------------
  Future<DocumentReference> addOrder(Orders order) {
    return orders.add(order.toMap());
  }

  //todo ---------------- Update Orders -------------------
  Future<void> updateOrder(Orders order) {
    return orders.doc(order.id).update(order.toMapWithoutDishes());
  }

  //todo ---------------- Delete Orders -------------------
  Future<void> deleteOrder(String id) async {
    print('Deleting order with id: $id');
    try {
      await orders.doc(id).delete();
    } catch (e) {
      print('Error deleting order: $e');
    }
  }

  Future<void> addToCart(BuildContext context, Dishes dish, Users user) async {
    if (dish.soldOut) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('This item is sold out!'),
          backgroundColor: Colors.red, // 设置消息框的背景颜色为红色
        ),
      );
    } else {
      double originalPrice = dish.price;
      double discountedPrice =
          dish.memberPrice ? originalPrice * 0.8 : originalPrice;
      double priceToAdd =
          user.role == 'CUSTOMER' ? discountedPrice : originalPrice;

      ShoppingCartItem cartItem = ShoppingCartItem(
        id: dish.id,
        name: dish.name,
        type: dish.type,
        imageUrl: dish.imageUrl,
        price: priceToAdd,
        quantity: 1,
        total: priceToAdd,
        username: user.username,
      );

      await addCartItem(cartItem);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item added to cart!'),
          backgroundColor: Colors.green, // 设置消息框的背景颜色为绿色
          duration: Duration(milliseconds: 500),
        ),
      );
    }
  }
}
