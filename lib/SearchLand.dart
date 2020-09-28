import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Land.dart';

class SearchLand extends StatelessWidget {
  List<Land> land = [

  ];
  SearchLand(this.land);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: Center(child: Text('List of land')),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: ListView.separated(itemBuilder: (context,index){
              return ListTile(
                title: Column(

                  children: [
                    Row(
                      children: [
                        Expanded(child: Image(image: NetworkImage("https://www.pngitem.com/pimgs/m/3-34847_transparent-grass-background-png-land-background-png-png.png"),)),
                        Expanded(child:Center(
                          child: Text(land[index].Location.toUpperCase() ,style: TextStyle(
                            color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),),
                        ))
                      ],
                    ),
                    ListTile(
                      leading: Text('Plot Size - ' , style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),),
                      title: Text(land[index].Plot_size.toString()),
                    ),
                    ListTile(
                      leading: Text('Description - ', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )),
                      title: Text(land[index].Description.toString()),
                    ),
                    ListTile(
                      leading: Text('Soil Type - ', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )),
                      title: Text(land[index].Soil_type.toString()),
                    ),
                    ListTile(
                      leading: Text('Price - ', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )),
                      title: Text(land[index].Price.toString()),
                    ),
                    ListTile(
                      leading: Text('Contact No. - ', style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )),
                      title: Text(land[index].ContactInfo.toString()),
                    ),
                    Center(
                      child: FlatButton(
                         child: Text('Proceed',style: TextStyle(
                           color: Colors.white,
                           fontSize: 12
                         ),),
                        onPressed: (){

                        },
                        color: Colors.blueGrey,
                      ),
                    ),
                    Divider(
                      thickness: 5,
                    )
                  ],

                ),);
            }, separatorBuilder: (context,index){
              return Divider();
            }, itemCount: land.length),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );;
  }
}