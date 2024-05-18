import 'package:flutter/material.dart';
import 'package:template01/components/dish_controllers.dart';
import 'package:template01/components/open_dish_box.dart';
import 'package:template01/models/dishes.dart';
import 'package:template01/services/firestore.dart';
import 'package:template01/user.dart';
// import 'package:template01/open_dish_box.dart'; // 确保你已经导入了 open_dish_box.dart 文件s

class CURD extends StatefulWidget {
  const CURD({Key? key, required User user}) : super(key: key);

  @override
  State<CURD> createState() => _CURDState();
}

class _CURDState extends State<CURD> {
  final firestoreService firestroeService = firestoreService();
  final MyController _myCtrls = MyController();
  final OpenDishBox openDishBox = OpenDishBox(); // 创建一个 OpenDishBox 类的实例

  bool? memberPrice; // Nullable bool for checkbox input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dishes'),
      ),
      body: StreamBuilder(
        stream: firestroeService.getDishes(), // Listen to the dishes stream
        builder: (BuildContext context, AsyncSnapshot<List<Dishes>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final dishes = snapshot.data!;
            return ListView.builder(
              itemCount: dishes.length,
              itemBuilder: (BuildContext context, int index) {
                final dish = dishes[index];
                return ListTile(
                  leading: dish.imageUrl != null && dish.imageUrl.isNotEmpty
                      ? Image.network(dish.imageUrl)
                      : Icon(Icons
                          .fastfood), // Use a default icon if imageUrl is null or empty
                  title: Text(dish.name),
                  subtitle: Text('Type: ${dish.type}, Price: ${dish.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          openDishBox.openDishBox(context,
                              dish:
                                  dish); // 使用 openDishBox 实例来调用 openDishBox 方法
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          print('Dish id is: ' + dish.id);
                          await firestroeService.deleteDish(dish.id);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Deleted dish with ID: ${dish.id}')),
                          );
                          setState(() {}); // Trigger a state update
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle dish tile tap if needed
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDishBox
              .openDishBox(context); // 使用 openDishBox 实例来调用 openDishBox 方法
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
//! final
