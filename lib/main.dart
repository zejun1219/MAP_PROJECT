// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:template01/admin_pages/CURD.dart';
// import 'package:template01/admin_pages/admin_page.dart';
// import 'package:template01/cstm_pages/payment_page.dart';
import 'package:template01/firebase_options.dart';
import 'package:template01/models/cart_model.dart';
import 'package:template01/authentication/login.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) {
    print('Firebase connected successfully!');
  }).catchError((error) {
    print('Failed to connect to Firebase: $error');
  });

  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //for now directly go to customers page
      home:LoginPage(),
    );
  }
}
