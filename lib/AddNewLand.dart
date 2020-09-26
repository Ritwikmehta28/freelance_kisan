import 'package:flutter/material.dart';

class AddNewLand extends StatefulWidget {
  @override
  _AddNewLandState createState() => _AddNewLandState();
}

class _AddNewLandState extends State<AddNewLand> {
  final Color primaryColor = Color(0xff18203d);


  void uploadImage()async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Plot Area',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Price',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Soil Type',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Area',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                  onPressed: () {
                    uploadImage()
                  }, elevation: 10.0, child: Text("Add images."),textColor: Colors.white,)
            ],
          ),
        ));
  }
}
