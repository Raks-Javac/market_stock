import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeachScreen extends StatefulWidget {
  const SeachScreen({super.key});

  @override
  State<SeachScreen> createState() => _SeachScreenState();
}

class _SeachScreenState extends State<SeachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: CupertinoSearchTextField(
          backgroundColor: Colors.grey,
          suffixIcon: Icon(
            Icons.date_range,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.date_range,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
