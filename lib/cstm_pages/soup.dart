import 'package:flutter/material.dart';
class SoupPage extends StatefulWidget {
  const SoupPage({super.key});

  @override
  State<SoupPage> createState() => _SoupPageState();
}

class _SoupPageState extends State<SoupPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: Text('Soup Page'),backgroundColor: Colors.deepPurple,),
    );
  }
}