import 'package:flutter/material.dart';
class BreadPage extends StatefulWidget {
  const BreadPage({super.key});

  @override
  State<BreadPage> createState() => _BreadPageState();
}

class _BreadPageState extends State<BreadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bread Page'),backgroundColor: Colors.deepPurple,),
    );
  }
}