import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddNewLand extends StatefulWidget {
  @override
  _AddNewLandState createState() => _AddNewLandState();
}

class _AddNewLandState extends State<AddNewLand> {
//  Variables
  String imageUrl;
  int plotArea = 0;
  String location = "Default";
  int price = 0;
  String soilType = "Default";
  String description = "Default";
  String contactInfo = "Default";
  Color primaryColor = Color(0xff18203d);

  CollectionReference plots = FirebaseFirestore.instance.collection('Plots');
  Future<void> addPlot() {
    return plots
        .add({
          'Plot_size': plotArea,
          'Soil_type': soilType,
          'Price': price,
          'Location': location,
          'Description': description,
          'ContactInfo': contactInfo
        })
        .then((value) => print("Plot added."))
        .catchError((error) => print("Failed to add user: $error"));
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage
            .ref()
            .child('folderName/imageName')
            .putFile(file)
            .onComplete;

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: Center(
          child: Container(
            child: Column(
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
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
                  TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      price = int.parse(value);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: 'Price(Rs.)',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      soilType = value;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: 'Soil Type',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      location = value;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: 'Location',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      description = value;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      contactInfo = value;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      labelText: 'Contact Info',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      addPlot();
                    },
                    elevation: 10.0,
                    child: Text("Upload data"),
                    textColor: Colors.white,
                  ),
                  (imageUrl != null)
                      ? Image.network(imageUrl)
                      : Placeholder(
                          fallbackHeight: 200.0, fallbackWidth: double.infinity),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Text('Upload Image'),
                    color: Colors.lightBlue,
                    onPressed: () => uploadImage(),
                  )
                ],
              ),
          ),
        ),
        );
  }
}
