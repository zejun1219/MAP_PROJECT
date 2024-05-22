import 'package:flutter/material.dart';
class ComboPage extends StatefulWidget {
  const ComboPage({super.key});

  @override
  State<ComboPage> createState() => _ComboPageState();
}

class _ComboPageState extends State<ComboPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text('Combo Page'),backgroundColor: Colors.deepPurple,),
    );
  }
}