// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template01/models/dishes.dart';
import 'package:template01/models/orders.dart';
import 'package:template01/models/shopping_cart.dart';

class FirestoreService {
  final CollectionReference dishes =
      FirebaseFirestore.instance.collection('dishes');
  final CollectionReference shoppingCartItems =
      FirebaseFirestore.instance.collection('shopping_cart');
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  //^ ------ ADD --------
  Future<void> addDish({
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
  }) {
    return dishes.add({
      'id': id,
      'name': name,
      'type': type,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
      'size': size,
      'memberPrice': memberPrice,
      'imageUrl': imageUrl, // 新增的字段
      'createDate': Timestamp.now(),
      'updateDate': Timestamp.now(),
    });
  }
//^ ADD: create an order
  Future<void> createOrder(shoppingOrder order) {
    return orders.add(order.toMap());
  }

//^ UPDATE: update dishes
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
    });
  }

  //^ UPDATE: update shopping cart
  Future<void> updateCartItem(ShoppingCartItem cartItem) {
    return shoppingCartItems.doc(cartItem.id).update({
      'name': cartItem.name,
      'type': cartItem.type,
      'imageUrl': cartItem.imageUrl,
      'price': cartItem.price,
      'quantity': cartItem.quantity,
      'totalPrice': cartItem.totalPrice,
      'username': cartItem.username,
    });
  }

  //^ ---DELETE-------
  Future<void> deleteDish(String id) async {
    try {
      await dishes.doc(id).delete();
    } catch (e) {
      print('Error deleting dish: $e');
    }
  }
  //^ DELETE: remove shopping cart by id

  Future<void> deleteCartItem(String id) async {
    try {
      await shoppingCartItems.doc(id).delete();
    } catch (e) {
      print('Error deleting shopping cart item: $e');
    }
  }
  //^ DELETE: remove shopping cart by username

    Future<void> deleteUserCartItems(String username) async {
    // 获取所有属于该用户的购物车项目
    QuerySnapshot querySnapshot = await shoppingCartItems
        .where('username', isEqualTo: username)
        .get();

    // 删除每一个项目
    for (var doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }

  


//^ ------ READ -------------------
  Stream<List<Dishes>> getDishes() {
    return dishes.snapshots().map((snapshot) {
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

  //^ --- READ: get shopping cart items-------------
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

//^ --- add shopping cart item-------------
  Future<void> addCartItem(ShoppingCartItem cartItem) {
    return shoppingCartItems.add({
      'id': cartItem.id,
      'name': cartItem.name,
      'type': cartItem.type,
      'imageUrl': cartItem.imageUrl,
      'price': cartItem.price,
      'quantity': cartItem.quantity,
      'totalPrice': cartItem.totalPrice,
      'username': cartItem.username,
    });
  }
}
