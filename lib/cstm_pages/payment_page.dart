import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:template01/cstm_pages/cstm_home.dart';
import 'package:template01/models/orders.dart';
import 'package:template01/models/shopping_cart.dart';
import 'package:template01/models/user.dart';
import 'package:template01/services/firestore.dart';

class PaymentPage extends StatelessWidget {
  final FirestoreService firestoreService =
      FirestoreService(); // 创建一个 FirestoreService 的实例
  final List<ShoppingCartItem> shoppingCartItems;
  final double totalPrice;
  final User user;

  PaymentPage({
    Key? key,
    required this.shoppingCartItems,
    required this.totalPrice,
    required this.user, // 添加这一行
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              label: 'Cardholder Name',
              hintText: 'Paul',
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              label: 'Card Number',
              hintText: '1234 5678 9012 3456',
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Expiration Date',
                    hintText: '10/28',
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: _buildTextField(
                    label: 'Security Code',
                    hintText: '123',
                    keyboardType: TextInputType.number,
                    icon: Icons.lock,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _showPaymentSuccessDialog(context);
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hintText,
    TextInputType? keyboardType,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: TextStyle(color: Colors.black, fontSize: 16.0),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(),
            suffixIcon: icon != null ? Icon(icon) : null,
          ),
          keyboardType: keyboardType,
        ),
      ],
    );
  }

//? ------------payment dialog go to components --------------------------
  void _showPaymentSuccessDialog(BuildContext context) {
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
                await firestoreService
                    .deleteUserCartItems(user.username); // 使用实例变量调用方法

                // 创建一个新的订单
                String dishes =
                    shoppingCartItems.map((item) => item.name).join(', ');
                shoppingOrder order = shoppingOrder(
                  username: user.username,
                  amount: totalPrice,
                  dishes: dishes,
                  createDate: DateTime.now(),
                );
                await firestoreService.createOrder(order); // 使用实例变量调用方法

                // 关闭对话框并导航到 CstmHome
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => CustomerHome(user: user)),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
