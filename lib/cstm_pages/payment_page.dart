import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:template01/cstm_pages/cstm_home.dart';
import 'package:template01/models/orders.dart';
import 'package:template01/models/shopping_cart.dart';
import 'package:template01/models/user.dart';
import 'package:template01/services/firestore.dart';
import 'package:template01/components/payment_page_com.dart'; // 导入新文件

class PaymentPage extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();
  final List<ShoppingCartItem> shoppingCartItems;
  final double totalPrice;
  final User user;

  PaymentPage({
    Key? key,
    required this.shoppingCartItems,
    required this.totalPrice,
    required this.user,
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
                showPaymentSuccessDialog(
                  context: context,
                  firestoreService: firestoreService,
                  user: user,
                  shoppingCartItems: shoppingCartItems,
                  totalPrice: totalPrice,
                );
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
}
//update this part and move some codes to components file , payment_page_com.dart
