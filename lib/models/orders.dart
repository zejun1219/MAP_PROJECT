import 'package:cloud_firestore/cloud_firestore.dart';

class shoppingOrder {
  // final String id;
  final String username;
  final double amount;
  final String dishes;
  final DateTime createDate;

  shoppingOrder({
    // this.id = 'default_id',
    required this.username,
    required this.amount,
    required this.dishes,
    required this.createDate,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'username': username,
      'amount': amount,
      'dishes': dishes,
      'create_date': Timestamp.fromDate(createDate),
    };
  }
}
