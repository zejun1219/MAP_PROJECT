import 'package:flutter/material.dart';
class StableFoodPage extends StatefulWidget {
  const StableFoodPage({super.key});

  @override
  State<StableFoodPage> createState() => _StableFoodPageState();
}

class _StableFoodPageState extends State<StableFoodPage> {
  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(title: Text('Stable Food Page'),backgroundColor: Colors.deepPurple,),
    );
  }
}