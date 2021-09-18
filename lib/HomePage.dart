import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'functions/firestore.dart';
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
      body: SingleChildScrollView(
        child: Container(
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
                  stream : firebaseFirestore.collection('cards').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if(snapshot.hasData){
                      if(snapshot.data.docs.length > 0){
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
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
                                        Padding(
                                          padding: EdgeInsets.only(top:_mediaQuery.width*0.035),
                                          child: Text(
                                              snapshot.data.docs[index]['title'],
                                            style: TextStyle(color: HexColor("#fFFFFFFf")),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top:_mediaQuery.width*0.035),
                                          child: Center(
                                            child: Padding(
                                              padding: EdgeInsets.only(top: _mediaQuery.height*0.035),
                                              child: Container(
                                                height: _mediaQuery.height*0.075,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                    border: Border.all(
                                                color: HexColor("##ff750A79")
                                              ),

                                                ),
                                                child: Center(
                                                  child: Text(
                                                    snapshot.data.docs[index]['count'].toString().padLeft(2,'0'),
                                                    style: TextStyle(color: HexColor("#fFFFFFFf"),
                                                    fontSize: _mediaQuery.height*0.025),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(),
                                          child: Row(

                                            children: [

                                              IconButton(
                                                icon: Icon(Icons.arrow_drop_up,color: HexColor("#ffffffff"),),
                                                onPressed : (){
                                                  int count = snapshot.data.docs[index]['count'];
                                                  String uid = snapshot.data.docs[index].id;
                                                  firebaseFirestore.collection('cards').doc(uid).set({
                                                    'count' : count+1,
                                                    'title' : snapshot.data.docs[index]['title'],
                                                  });
                                                }

                                              ),

                                              SizedBox(width: _mediaQuery.width*0.1,),

                                              IconButton(
                                                icon: Icon(Icons.arrow_drop_down,color: HexColor("#ffffffff")),
                                                onPressed : (){
                                                  int count = snapshot.data.docs[index]['count'];
                                                  String uid = snapshot.data.docs[index].id;
                                                  if(count > 0){
                                                    firebaseFirestore.collection('cards').doc(uid).set({
                                                      'count' : count-1,
                                                      'title' : snapshot.data.docs[index]['title'],
                                                    });
                                                  }
                                                }
                                              )

                                            ],

                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      }else{
                        print('error, no data to show');
                      }
                    }return Center(child: CircularProgressIndicator(),);
                  }
                ),
              ),

              Expanded(
                child: Container(
                  child: Center(
                     child: Text(

                     ),
                  )
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}