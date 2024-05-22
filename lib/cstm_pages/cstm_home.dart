import 'package:flutter/material.dart';
import 'package:template01/cstm_pages/bread.dart';
import 'package:template01/cstm_pages/combo.dart';
import 'package:template01/cstm_pages/dessert.dart';
import 'package:template01/cstm_pages/drinks.dart';
import 'package:template01/cstm_pages/pizza.dart';
// import 'package:template01/cstm_pages/shopping_cart.dart';
import 'package:template01/cstm_pages/snack.dart';
import 'package:template01/cstm_pages/soup.dart';
import 'package:template01/cstm_pages/stable_food.dart';
import 'package:template01/cstm_pages/steak.dart';
// import 'package:template01/models/dishes.dart';
import 'package:template01/models/user.dart';
import 'package:template01/pages/login.dart';
import 'package:template01/pages/my_profile.dart';

class CustomerHome extends StatefulWidget {
  final User user; // 添加这一行

  const CustomerHome({
    Key? key,
    required this.user, // 添加这一行
  }) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Home Page'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
//? ------------ drawer go to components --------------------------
            DrawerHeader(
              child: Icon(Icons.settings_accessibility, size: 60),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyProfilePage(
                            user: widget.user))); // 使用 widget.user
              },
            ),
            ListTile(
              leading: Icon(Icons.local_pizza),
              title: Text('Pizza'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PizzaPage(user: widget.user))); // 使用 widget.user
              },
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: Text('Combo'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ComboPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_dining),
              title: Text('Snack'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SnackPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_bar),
              title: Text('Steak'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SteakPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_pizza),
              title: Text('Bread'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BreadPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.icecream),
              title: Text('Dessert'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DessertPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_drink),
              title: Text('Drinks'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DrinksPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.soup_kitchen),
              title: Text('Soup'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SoupPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.restaurant),
              title: Text('Stable Food'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StableFoodPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
