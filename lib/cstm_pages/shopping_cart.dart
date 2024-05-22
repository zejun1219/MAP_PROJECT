import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template01/cstm_pages/payment_page.dart';
import 'package:template01/models/cart_model.dart';
import 'package:template01/models/dishes.dart';
import 'package:template01/models/orders.dart';
import 'package:template01/models/shopping_cart.dart';
import 'package:template01/models/user.dart';
import 'package:template01/services/firestore.dart';

class ShoppingCartPage extends StatefulWidget {
  final List<ShoppingCartItem> shoppingCartItems; // 这里声明的是 ShoppingCartItem 对象的列表
  final double totalPrice;
  final User user; // 添加这一行

  const ShoppingCartPage({
    Key? key,
    required this.shoppingCartItems, // 添加这一行
    required this.totalPrice,
    required this.user, 
  }) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: StreamBuilder(
        stream: firestoreService
            .getShoppingCartItems(widget.user.username), // Listen to the dishes stream
        builder: (BuildContext context,
            AsyncSnapshot<List<ShoppingCartItem>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final shoppingCartItems = snapshot.data!;
            double totalPrice = shoppingCartItems.fold(
                0, (sum, item) => sum + item.totalPrice); // 计算总价
            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: shoppingCartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      final items = shoppingCartItems[index];
                      return ListTile(
                        leading: items.imageUrl != null &&
                                items.imageUrl.isNotEmpty
                            ? Image.network(items.imageUrl)
                            : Icon(Icons
                                .fastfood), // Use a default icon if imageUrl is null or empty
                        title: Text(items.name),
                        subtitle: Text(
                            'Type: ${items.type}, Price: ${items.totalPrice},Quantity: ${items.quantity},'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () async {
                                if (items.quantity > 0) {
                                  items.quantity--;
                                  items.totalPrice =
                                      items.price * items.quantity;
                                  await firestoreService.updateCartItem(
                                      items); // Update the item in Firebase
                                }
                                if (items.quantity == 0) {
                                  await firestoreService.deleteCartItem(items
                                      .id); // Delete the item from Firebase
                                }
                              },
                            ),
                            Text('${items.quantity}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () async {
                                items.quantity++;
                                items.totalPrice = items.price * items.quantity;
                                await firestoreService.updateCartItem(
                                    items); // Update the item in Firebase
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          // Handle dish tile tap if needed
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {
                    // 立即导航到 PaymentPage，并将购物车中的商品和总价作为参数传递
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(
                          shoppingCartItems: shoppingCartItems,
                          totalPrice: totalPrice,
                          user: widget.user,// currentUser 是当前登录的用户
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
