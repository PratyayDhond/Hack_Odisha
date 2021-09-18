import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'timer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  int _index = 0;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor("#ff130B20"),
      appBar: AppBar(
        backgroundColor: HexColor("#ff130B20"),
        title: Text(
          'Rehab',
        style: TextStyle(fontSize: _mediaQuery.height/20,color: HexColor("#ffF31B72")),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: _mediaQuery.height*0.35,
              width: _mediaQuery.width*0.95,
              child: Padding(
                padding: EdgeInsets.only(left: _mediaQuery.width*0.05),
                child: Container(
                  child: Timer(),
                ),
              ),
            ),
             // Divider(color: Colors.white,),

            SizedBox(
              height: 200, // card height
              child: StreamBuilder(
                Stream :

                builder: (context, Asyncsnapshots snapshots) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context,index){

                      return Padding(
                        padding: EdgeInsets.all(_mediaQuery.height*0.005),
                        child: SizedBox(
                          height: _mediaQuery.height/100,
                          width: _mediaQuery.width*0.38,
                          child: Card(
                            color: HexColor("#ff231539"),
                            child: Column(
                              children: [

                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                 ),
              ),
            ),


          ],
        ),
      ),

    );
  }
}