import 'package:flutter/material.dart';

class MyBagScreen extends StatelessWidget {
  const MyBagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,

        title: Text("My Bag",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}