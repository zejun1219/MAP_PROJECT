import 'package:flutter/material.dart';
class DessertPage extends StatefulWidget {
  const DessertPage({super.key});

  @override
  State<DessertPage> createState() => _DessertPageState();
}

class _DessertPageState extends State<DessertPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text('Dessert Page'),backgroundColor: Colors.deepPurple,),
    );
  }
}