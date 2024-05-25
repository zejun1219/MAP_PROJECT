import 'package:flutter/material.dart';
import 'package:template01/pages/contact_us.dart';
import 'package:template01/pages/login.dart';
import 'package:template01/pages/my_profile.dart';
import 'package:template01/models/user.dart';
import 'package:template01/admin_pages/CURD.dart';
// import 'package:template01/pages/login.dart';
import 'package:template01/admin_pages/admin_page.dart';

class AdminPageCom extends StatelessWidget {
  final User user;

  const AdminPageCom({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          DrawerHeader(child: Icon(Icons.settings_accessibility, size: 60)),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("HOME"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminHome(user: user)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyProfilePage(key: UniqueKey(), user: user)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("CONTACT US"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ContactUsPage(key: UniqueKey(), user: user)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("CRUD"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CURD(key: UniqueKey(), user: user)),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
