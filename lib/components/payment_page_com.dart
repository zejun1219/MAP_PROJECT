import 'package:flutter/material.dart';
import 'package:template01/models/orders.dart';
import 'package:template01/models/shopping_cart.dart';
import 'package:template01/models/user.dart';
import 'package:template01/services/firestore.dart';
import 'package:template01/cstm_pages/cstm_home.dart';

void showPaymentSuccessDialog({
  required BuildContext context,
  required FirestoreService firestoreService,
  required Users user,
  required List<ShoppingCartItem> shoppingCartItems,
  required double totalPrice,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Payment Successful!'),
        content: Text('Your payment was successful.'),
        actions: [
          TextButton(
            onPressed: () async {
              // 删除所有属于当前用户的购物车项目
              await firestoreService.deleteUserCartItems(user.username);

              // 创建一个新的订单
              String dishes = shoppingCartItems.map((item) => item.name).join(', ');
              shoppingOrder order = shoppingOrder(
                username: user.username,
                amount: totalPrice,
                dishes: dishes,
                createDate: DateTime.now(),
              );
              await firestoreService.createOrder(order);

              // 关闭对话框并导航到 CstmHome
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => CustomerHome(user: user)),
              );
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
