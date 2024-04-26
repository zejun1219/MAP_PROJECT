import 'package:flutter_application_1/pages/contact_us.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/user.dart';
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
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            const DrawerHeader(
                child: Icon(Icons.settings_accessibility, size: 60)),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("HOME"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(user: widget.user)),
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
                          MyProfilePage(key: UniqueKey(), user: widget.user)),
                );
              },
            ),
            //
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("CONTACT US"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ContactUsPage(key: UniqueKey(), user: widget.user)),
                );
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
