import 'package:flutter/material.dart';
class SteakPage extends StatefulWidget {
  const SteakPage({super.key});

  @override
  State<SteakPage> createState() => _SteakPageState();
}

class _SteakPageState extends State<SteakPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text('Steak Page'),backgroundColor: Colors.deepPurple,),
    );
  }
}