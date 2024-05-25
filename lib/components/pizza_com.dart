import 'package:flutter/material.dart';
import 'package:template01/models/shopping_cart.dart';
import 'package:template01/models/user.dart';
import 'package:template01/services/firestore.dart';
import 'package:template01/cstm_pages/shopping_cart.dart';

class ShoppingCartArea extends StatelessWidget {
  final FirestoreService firestoreService;
  final User user;

  const ShoppingCartArea({
    Key? key,
    required this.firestoreService,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firestoreService.getShoppingCartItems(user.username),
      builder: (BuildContext context,
          AsyncSnapshot<List<ShoppingCartItem>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final shoppingCartItems = snapshot.data!;
          int itemCount = shoppingCartItems.length;
          double totalPrice = shoppingCartItems.fold(
              0, (sum, item) => sum + item.totalPrice); // 计算总价
          return BottomAppBar(
            child: ListTile(
              title: Text('Shopping Cart ($itemCount items)'),
              subtitle: Text('\$${totalPrice.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                child: Text('Shopping Cart'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ShoppingCartPage(
                        shoppingCartItems: shoppingCartItems,
                        totalPrice: totalPrice,
                        user: user,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
