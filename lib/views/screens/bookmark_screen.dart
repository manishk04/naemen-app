import 'package:flutter/material.dart';

class MyScendScreen extends StatelessWidget {
  const MyScendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,

        title: Text("Bookmark",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}