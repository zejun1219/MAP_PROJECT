import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/contact_us.dart';

import 'package:flutter_application_1/pages/my_profile.dart';
import 'package:flutter_application_1/user.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Column(children: [
          DrawerHeader(child: Icon(Icons.settings_accessibility, size: 60)),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("HOME"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage(user: user)),
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
          //
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
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.pushNamed(context, '/loginPage');
            },
          )
        ]),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),
          //    const Divider(),
          //
          //

          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),
          //    const Divider(),
          //
          //
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),
          //  const Divider(),

          //
          //
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),
          //    const Divider(),
          //
          //
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),
          //     const Divider(),
          //
          //
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),
          //
          //

          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),

          //
          //
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),
          //
          //
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),

          //
          //
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white, // 添加背景色
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10), // 圆角矩形
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 1),
            margin: const EdgeInsets.fromLTRB(5, 15, 5, 5),
            child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // 图片圆角
                  child: Image.asset(
                    "lib/images/pizza.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text(
                  "Shrimp pizza",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold), // 加粗字体
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        // 减少商品数量的逻辑
                      },
                    ),
                    const Text(
                      "0", // 这里应该是商品数量的变量
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        // 增加商品数量的逻辑
                      },
                    )
                  ],
                )),
          ),
          const Divider(), //
        ],
      ),
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
