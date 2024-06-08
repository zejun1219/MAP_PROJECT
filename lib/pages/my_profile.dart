import 'package:template01/admin_pages/admin_page.dart';
import 'package:template01/pages/contact_us.dart';
// import 'package:template01/pages/home_page.dart';
// import 'package:template01/pages/CURD.dart';
import 'package:template01/models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:template01/authentication/login.dart';

class MyProfilePage extends StatefulWidget {
  final User user;

  const MyProfilePage({Key? key, required this.user}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(
          //       color: Color.fromARGB(255, 107, 166, 214), width: 4.0),
          //   borderRadius: BorderRadius.circular(12.0),
          // ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoCard(
                  icon: Icons.person,
                  title: 'Username',
                  subtitle: widget.user.username,
                ),
                SizedBox(height: 16.0),
                _buildInfoCard(
                  icon: Icons.email,
                  title: 'Email',
                  subtitle: widget.user.email,
                ),
                SizedBox(height: 16.0),
                _buildInfoCard(
                  icon: Icons.phone,
                  title: 'Contact',
                  subtitle: widget.user.phone,
                ),
                SizedBox(height: 16.0),
                _buildInfoCard(
                  icon: Icons.timer,
                  title: 'Create Time',
                  subtitle: DateFormat('yyyy-MM-dd – kk:mm')
                      .format(widget.user.createTime),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return GestureDetector(
      onTap: () {
        // Add your onTap functionality here
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40.0,
                color: Colors.blue,
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, size: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
