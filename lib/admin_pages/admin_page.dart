import 'package:flutter/material.dart';
import 'package:template01/models/user.dart';
import 'package:template01/components/admin_navigator.dart'; // Import the component

class MyApp extends StatelessWidget {
  final Users user;

  const MyApp({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              fontFamily: 'Hind', fontSize: 18, color: Colors.black87),
        ),
      ),
      home: AdminPageCom(user: user), // Use the imported component here
    );
  }
}

class AdminHome extends StatelessWidget {
  final Users user;

  const AdminHome({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'imagePath': 'lib/images/BlackPepperBeefPizza.jpg',
        'name': '''Black Pepper 
Beef Pizza''',
      },
      {
        'imagePath': 'lib/images/durian.jpg',
        'name': 'Durian Pizza',
      },
      {
        'imagePath': 'lib/images/pineMeatPizza.jpg',
        'name': 'Pine Meat Pizza',
      },
      {
        'imagePath': 'lib/images/seafood.jpg',
        'name': 'Seafood Pizza',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue,
      ),
      drawer: AdminPageCom(user: user), // Use the imported component here
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/images/LOGO.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'hot-sale products',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imagePath: products[index]['imagePath']!,
                    name: products[index]['name']!,
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'About Us',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'We are a company committed to providing high quality Pizza products. Our goal is to provide the best shopping experience for our customers. We adopt the shopping mode that customers scan the code to order, which improves the efficiency of delivery and reduces the error rate of delivery.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Core Idea',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'We are committed to providing our customers with the best pizza products and services to meet your various needs. Use fresh ingredients and make every pizza carefully. Our team is always customer-centric, providing friendly and professional service.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {
                        'https://web.whatsapp.com';
                      }),
                  IconButton(
                    icon: Icon(Icons.facebook),
                    onPressed: () {
                      ('https://facebook.com'); // 打开 Facebook 网站链接
                    },
                  ),
                  IconButton(
                      icon: Icon(Icons.web),
                      onPressed: () {
                        'https://www.google.com';
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
