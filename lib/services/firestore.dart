// import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:template01/models/dishes.dart';

class firestoreService {
  final CollectionReference dishes =
      FirebaseFirestore.instance.collection('dishes');

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

  //^ ---DELETE-------
  Future<void> deleteDish(String id) async {
    try {
      await dishes.doc(id).delete();
    } catch (e) {
      print('Error deleting dish: $e');
    }
  }

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

//^ --- update -------------
//   Future<void> updateDish({
//     required String id,
//   required String name,
//   required String type,
//   required String description,
//   required String image,
//   required double price,
//   required int quantity,
//   required int size,
//   required bool memberPrice,
//   required String imageUrl, // 新增的参数
// }) async {
//   await dishes.doc(id).update({
//     'name': name,
//     'type': type,
//     'description': description,
//     'image': image,
//     'price': price,
//     'quantity': quantity,
//     'size': size,
//     'memberPrice': memberPrice,
//     'imageUrl': imageUrl, //
//     });
//   }
}
