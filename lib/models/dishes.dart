import 'package:cloud_firestore/cloud_firestore.dart';
class Dishes {
  late String id; // Your defined ID attribute
  late String name;
  late String description;
  late String image;
  final String imageUrl;
  late double price;
  late int quantity;
  late int size;
  late String type;
  late bool memberPrice;
  late Timestamp createDate;
  late Timestamp updateDate;
  late int salesVolume; // 新增的销量属性
  late bool soldOut; // 新增的销售状态属性

  // Constructor
  Dishes({
    required this.id, // Modify constructor to accept id parameter
    required this.name,
    required this.description,
    required this.image,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.size,
    required this.type,
    required this.memberPrice,
    required this.createDate,
    required this.updateDate,
    required this.salesVolume, // 在构造函数中添加销量参数
    required this.soldOut, // 在构造函数中添加销售状态参数
  });

  // Factory constructor to create a Dish object from a Firebase document snapshot
  factory Dishes.fromMap(Map<String, dynamic> map) {
    return Dishes(
      id: map['id'], // Store the ID provided by Firebase into the property
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      imageUrl: map['imageUrl'] ?? '', 
      price: (map['price'] ?? 0.0).toDouble(),
      quantity: (map['quantity'] ?? 0).toInt(),
      size: (map['size'] ?? 0).toInt(),
      type: map['type'] ?? '',
      memberPrice: map['memberPrice'] ?? false,
      createDate: map['createDate'] as Timestamp,
      updateDate: map['updateDate'] as Timestamp,
      salesVolume: (map['salesVolume'] ?? 0).toInt(), // 从 Firebase 文档快照中获取销
      soldOut: map['soldOut'] ?? false,
    );
  }
}


