import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewLand extends StatefulWidget {
  @override
  _AddNewLandState createState() => _AddNewLandState();
}

class _AddNewLandState extends State<AddNewLand> {
//  Variables
  int plotArea = 0;
  String location = "Default";
  int price = 0;
  String soilType = "Default";
  Color primaryColor = Color(0xff18203d);

  void uploadImage() async {}

  CollectionReference users = FirebaseFirestore.instance.collection('Plots');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'Plot_size': plotArea,
          'Soil_type': soilType,
          'Price': price,
          'Location': location
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
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
                onChanged: (value) {
                  plotArea = int.parse(value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Plot Area(m^2)',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  price = int.parse(value);
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Price(Rs.)',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  soilType = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Soil Type',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextFormField(
                onChanged: (value) {
                  location = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: 'Location',
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  addUser();
                },
                elevation: 10.0,
                child: Text("Upload data"),
                textColor: Colors.white,
              )
            ],
          ),
        ));
  }
}
