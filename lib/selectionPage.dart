import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freelancekisan/AddNewLand.dart';
import 'package:freelancekisan/SearchLand.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Land.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  final Color primaryColor = Color(0xff18203d);
  FirebaseFirestore _db = FirebaseFirestore.instance;
  List<Land> land=[
  ];
  List<Land> shownLand=[
  ];
  Future<List<Land>> getData() async {

    await _db.collection('Plots').get().then((querysnapshot){
      querysnapshot.docs.forEach((element) {
        int Plot_size = element.data()['Plot_size'];
        String Location= element.data()['Location'].toString();
        String Soil_type= element.data()['Soil_type'].toString();
        int Price = element.data()['Price'];
        String Description = element.data()['Description'];
        String ContactInfo = element.data()['ContactInfo'];
        String Id= element.id.toString();
        Land L = Land(Plot_size,Price,Soil_type,Description,ContactInfo,Location,Id);
        land.add(L);
      });
    });
  }

 List<Land> addNewData(){
    List<Land> toshow=[
      ];
    int i=0;
    while(i<land.length)
      {
        if(i<shownLand.length)
          {
            if(shownLand[i].Id == land[i].Id)
              {
                i++;
              }
            else
              {
                shownLand.add(land[i]);
                toshow.add(land[i]);
                i++;
              }
          }
        else
          {
            shownLand.add(land[i]);
            toshow.add(land[i]);
          }
      }
      return toshow;
  }
  //Project
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: primaryColor,
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Select To Search Land or Add Land.',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(color: Colors.white, fontSize: 28),
              ),
              SizedBox(height: 20),
              Text(
                'We come to a cross-road here, Select one to continue further.',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(color: Colors.white, fontSize: 14),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(height: 30),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AddNewLand()));
                },
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text('Add New Land.',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
                textColor: Colors.white,
              ),
              SizedBox(height: 20),
              MaterialButton(
                elevation: 0,
                minWidth: double.maxFinite,
                height: 50,
                onPressed: () async{
                  await getData();
                  List<Land> toshow = addNewData();
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SearchLand(toshow)));
                },
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Text('Search for a Land to work on.',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
                textColor: Colors.white,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
