import 'package:flutter_application_1/user.dart'; // 确保这个路径正确，用户数据类文件
import 'package:flutter/material.dart';

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
        backgroundColor: Colors.blue, // 将AppBar的背景色设置为蓝色
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            const DrawerHeader(
                child: Icon(Icons.settings_accessibility, size: 60)),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("HOME"),
              onTap: () {
                Navigator.pushNamed(context, '/homePage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("My Profile"),
              onTap: () {
                Navigator.pushNamed(context, '/myProfilePage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("CONTACT US"),
              onTap: () {
                Navigator.pushNamed(context, '/contactUsPage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushNamed(context, '/loginPage');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromARGB(255, 107, 166, 214), width: 4.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
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
