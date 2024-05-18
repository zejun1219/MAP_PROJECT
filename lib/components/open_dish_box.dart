import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template01/components/dish_controllers.dart';
import 'package:template01/models/dishes.dart';
import 'package:template01/services/firestore.dart';

class OpenDishBox {
  String imageUrl = '';
  final firestoreService firestroeService = firestoreService();
  final MyController _myCtrls = MyController();

  bool? memberPrice; // Nullable bool for checkbox input

  void openDishBox(BuildContext context, {Dishes? dish}) {
    _myCtrls.idController.text = dish?.id ?? '';
    _myCtrls.nameController.text = dish?.name ?? '';
    _myCtrls.typeController.text = dish?.type ?? '';
    _myCtrls.descriptionController.text = dish?.description ?? '';
    _myCtrls.imageController.text = dish?.image ?? '';
    _myCtrls.priceController.text = dish?.price.toString() ?? '';
    _myCtrls.quantityController.text = dish?.quantity.toString() ?? '';
    _myCtrls.sizeController.text = dish?.size.toString() ?? '';
    memberPrice = dish?.memberPrice;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(dish == null ? 'Add Dish' : 'Update Dish'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _myCtrls.idController,
                decoration: InputDecoration(labelText: 'ID'),
                enabled: dish == null, // Disable editing if updating
              ),
              TextField(
                controller: _myCtrls.nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _myCtrls.typeController,
                decoration: InputDecoration(labelText: 'Type'),
              ),
              TextField(
                controller: _myCtrls.descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () async {
                  final file = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (file == null) return;
                  String fileName =
                      DateTime.now().microsecondsSinceEpoch.toString();
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDireImages =
                      referenceRoot.child('my_images');
                  Reference referenceImageToUpload =
                      referenceDireImages.child(fileName);
                  try {
                    await referenceImageToUpload.putFile(File(file.path));
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (error) {}
                },
              ),
              TextField(
                controller: _myCtrls.priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              TextField(
                controller: _myCtrls.quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
              ),
              TextField(
                controller: _myCtrls.sizeController,
                decoration: InputDecoration(labelText: 'Size'),
              ),
              Row(
                children: [
                  Text('Member Price: '),
                  Checkbox(
                    value: memberPrice ?? false,
                    onChanged: (value) {
                      memberPrice = value; // Update memberPrice state
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Validate ID field
              if (_myCtrls.idController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter an ID')),
                );
                return;
              }

              // Validate quantity and price inputs
              int quantity;
              try {
                quantity = int.parse(_myCtrls.quantityController.text);
              } catch (e) {
                // Show error message if quantity is not a valid integer
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter a valid quantity')),
                );
                return;
              }

              double price;
              try {
                price = double.parse(_myCtrls.priceController.text);
              } catch (e) {
                // Show error message if price is not a valid number
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter a valid price')),
                );
                return;
              }

              if (dish == null) {
  // Add dish if quantity and price are valid
  firestroeService.addDish(
    id: _myCtrls.idController.text,
    name: _myCtrls.nameController.text,
    type: _myCtrls.typeController.text,
    description: _myCtrls.descriptionController.text,
    image: _myCtrls.imageController.text,
    price: price,
    quantity: quantity,
    size: int.parse(_myCtrls.sizeController.text),
    memberPrice: memberPrice ?? false, // Provide a default value if memberPrice is null
    imageUrl: imageUrl, // 新增的参数
  );
} else {
  // Update dish if quantity and price are valid
  firestroeService.updateDish(
    id: dish.id,
    name: _myCtrls.nameController.text,
    type: _myCtrls.typeController.text,
    description: _myCtrls.descriptionController.text,
    image: _myCtrls.imageController.text,
    price: price,
    quantity: quantity,
    size: int.parse(_myCtrls.sizeController.text),
    memberPrice: memberPrice ?? false, // Provide a default value if memberPrice is null
    imageUrl: imageUrl, // 新增的参数
  );
}

              // input cleaning
              _myCtrls.idController.clear();
              _myCtrls.nameController.clear();
              _myCtrls.typeController.clear();
              _myCtrls.descriptionController.clear();
              _myCtrls.imageController.clear();
              _myCtrls.priceController.clear();
              _myCtrls.quantityController.clear();
              _myCtrls.sizeController.clear();
              Navigator.pop(context);
            },
            child: Text(dish == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }
}
