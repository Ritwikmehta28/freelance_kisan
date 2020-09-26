import 'package:flutter/material.dart';

class Searchland extends StatefulWidget {
  @override
  _SearchlandState createState() => _SearchlandState();
}

class _SearchlandState extends State<Searchland> {
  final Color primaryColor = Color(0xff18203d);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: primaryColor,
    );
  }
}
