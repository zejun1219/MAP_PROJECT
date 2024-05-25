import 'package:flutter/material.dart';
import 'package:template01/cstm_pages/shopping_cart.dart';
import 'package:template01/models/dishes.dart';
import 'package:template01/models/shopping_cart.dart';
import 'package:template01/models/user.dart';
import 'package:template01/services/firestore.dart'; // Import the Dishes model
// update pizza.dart 
class PizzaPage extends StatefulWidget {
    final User user; // 添加这一行

  const PizzaPage({Key? key, required this.user}) : super(key: key); // 初始化 user

  @override
  State<PizzaPage> createState() => _PizzaPageState();
}

// class _PizzaPageState extends State<PizzaPage>
class _PizzaPageState extends State<PizzaPage> {
  final FirestoreService firestoreService = FirestoreService();

  List<ShoppingCartItem> shoppingCartItems = []; // 在这里定义 'shoppingCartItems'
  double totalPrice = 0.0;
  Future<void> _showSizeDialog(Dishes dish) async {
    double price = dish.price;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Choose Size'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('9 in'),
                    leading: Radio<double>(
                      value: dish.price,
                      groupValue: price,
                      onChanged: (double? value) {
                        setState(() {
                          price = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('12 in'),
                    leading: Radio<double>(
                      value: dish.price + 10,
                      groupValue: price,
                      onChanged: (double? value) {
                        setState(() {
                          price = value!;
                        });
                      },
                    ),
                  ),
                  Text('Price:\$' + price.toString()),
                  ElevatedButton(
                    child: Text('Add to Cart'),
                    onPressed: () async {
                      // 创建一个 ShoppingCartItem 对象
                      ShoppingCartItem cartItem = ShoppingCartItem(
                        id: dish.id,
                        name: dish.name,
                        type: dish.type,
                        imageUrl: dish.imageUrl,
                        price: price,
                        quantity: 1, // 默认数量为1
                        totalPrice: price, // 初始总价等于单价
                        username: widget.user.username, // 这里假设用户名为 'user1'，你需要根据实际情况修改
                      );

                      // 将 ShoppingCartItem 对象添加到 Firebase 中
                      await firestoreService.addCartItem(cartItem);

                      // close shopping cart
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

 void _showConfirmationAnimation() {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width,
        child: Material(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.center,
            child: AnimatedOpacity(
              opacity: 1,
              duration: Duration(seconds: 3),
              child: Container(
                height: 50,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  'Item added to cart!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Page'),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder(
        stream: firestoreService.getDishes(), // Listen to the dishes stream
        builder: (BuildContext context, AsyncSnapshot<List<Dishes>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final dishes = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 每行显示两个图片
              ),
              itemCount: dishes.length,
              itemBuilder: (BuildContext context, int index) {
                final dish = dishes[index];
                return Card(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: dish.imageUrl != null &&
                                    dish.imageUrl.isNotEmpty
                                ? Image.network(dish.imageUrl,
                                    fit: BoxFit.cover)
                                : Icon(Icons
                                    .fastfood), // Use a default icon if imageUrl is null or empty
                          ),
                          Text(dish.name),
                          Text('Price: ${dish.price}'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(Icons.add_circle, color: Colors.green),
                          onPressed: () => _showSizeDialog(dish),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      //? ----------- shopping cart area go to components -----------
      bottomNavigationBar: StreamBuilder(
        stream: firestoreService.getShoppingCartItems(widget.user.username),
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
                          shoppingCartItems:
                              shoppingCartItems, // 这里传递的是 ShoppingCartItem 对象的列表
                          totalPrice: totalPrice,
                          user: widget.user, // 使用 widget.user 
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
