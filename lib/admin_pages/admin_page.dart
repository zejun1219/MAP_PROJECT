import 'package:flutter/material.dart';
import 'package:template01/pages/contact_us.dart';
import 'package:template01/authentication/login.dart';
import 'package:template01/pages/my_profile.dart';
import 'package:template01/models/user.dart';
import 'package:template01/admin_pages/CURD.dart';
import 'package:template01/components/admin_page_com.dart'; // Import the component

class AdminHome extends StatelessWidget {
  final User user;

  const AdminHome({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue,
      ),
      drawer: AdminPageCom(user: user), // Use the imported component here
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action here, e.g., navigate to a shopping cart page
          print('Navigate to shopping cart');
        },
        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
