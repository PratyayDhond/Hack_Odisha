import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ViewModel/Menu.dart';
import 'functions/firestore.dart';
import 'functions/quotes.dart';
import 'timer.dart';
import 'package:breaking_bad_quotes/breaking_bad_quotes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home>{
  int _index = 0;


FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  int randomNumber = 0;

  @override
  void initState() {
    // TODO: implement initState
    Random random = new Random();
    randomNumber = random.nextInt(101);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    var reset = false;
    int duration = 60*60*24*90;
    return Scaffold(

      floatingActionButton: Container(
        decoration: BoxDecoration(
          border : Border.all(
            color: HexColor("#ff88078D"),
          ),
          borderRadius: BorderRadius.circular(_mediaQuery.height),
        ),
        child: FloatingActionButton(
          onPressed: (){
            showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  backgroundColor:HexColor("#ff231539"),
                  content: Container(
                    height: _mediaQuery.height*0.60,
                    width: _mediaQuery.width*0.90,
                    child: Column(
                      children: [
                        SizedBox(
                          height: _mediaQuery.height*0.30,
                          width: _mediaQuery.width*0.70,
                          child: Container(

                            child: Image(
                              image: AssetImage("assets/relapse.png"),
                            ),
                          ),
                        ),
                        Text('Are you sure you want to relapse?',
                        style: TextStyle(color: HexColor("#ffB0B0B0")
                          ),
                        ),

                        Text('(This will reset your streak)',
                          style: TextStyle(color: HexColor("#ffB0B0B0")
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: _mediaQuery.height*0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: Text('Yes'),
                                onPressed : (){
                                  setState(){
                                    reset = true;
                                  }
                                  Navigator.pop(context);
                                }
                              ),
                              SizedBox(
                                width: _mediaQuery.width*0.10,
                              ),

                              TextButton(
                                  child: Text('No'),
                                  onPressed : (){
                                    Navigator.pop(context);
                                  }
                              ),

                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                );
              }

            );
          },
          backgroundColor: HexColor("#ff130B20"),
          child: Icon(
            Icons.refresh,
            color: HexColor("#ffB0B0B0"),
          ),

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        color: HexColor("#ff0D0B10"),
        child: SizedBox(
          height: _mediaQuery.height*0.08,

          child: Container(
            decoration: BoxDecoration(
              border : Border(
                top: BorderSide(
                  color: HexColor("#ff88078D"),
                ),
              ),

            ),
            child: Row(
                children: [
                   Padding(
                     padding: EdgeInsets.only(left: _mediaQuery.width*0.03),
                     child: IconButton(
                       icon: Icon(Icons.home_outlined, color: HexColor("#ffB0B0B0"),),
                       iconSize: _mediaQuery.height*0.040,
                       onPressed: (){},
                     ),
                   ),

                  Padding(
                    padding: EdgeInsets.only(left: _mediaQuery.width*0.68),
                    child: IconButton(
                      icon: Icon(Icons.menu, color: HexColor("#ffB0B0B0"),),
                      iconSize: _mediaQuery.height*0.040,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Menu(),
                        ));
                      },
                    ),
                  ),

                ],
            ),
          ),
        ),
      ),
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

              InkWell(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor: HexColor("#ff231539"),
                      content: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: HexColor("#ff231539"),
                        ),
                        height: _mediaQuery.height*0.4,
                        width: _mediaQuery.width*0.9,
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width*0.05,vertical: _mediaQuery.height*0.05),
                                child: Text(
                                  '"' + JSONquotes[randomNumber]['quote']! +'"',
                                  style: TextStyle(
                                      color: HexColor("#ffB0B0B0"),
                                      fontSize: _mediaQuery.height*0.025,
                                      overflow: TextOverflow.clip
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width*0.05),
                                child: Text(
                                  '- ' + JSONquotes[randomNumber]['author']!,
                                  style: TextStyle(
                                      color: HexColor("#ffB0B0B0"),
                                      fontSize: _mediaQuery.height*0.025,
                                      overflow: TextOverflow.clip
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: _mediaQuery.height*0.05,left: _mediaQuery.height*0.025,right: _mediaQuery.height*0.025),
                  child: SizedBox(
                    height: _mediaQuery.height*0.20,
                    child: Column(
                      children: [
                        Container(
                            child: Text('"'+JSONquotes[randomNumber]['quote']!+'"',style: TextStyle(overflow: TextOverflow.ellipsis,color: HexColor("#FFB0B0B0"),fontSize: _mediaQuery.height*0.030),),
                          ),
                        Container(
                          child: Align(
                            alignment: Alignment(0.85,0),
                              child: Text('-' + JSONquotes[randomNumber]['author']!,style: TextStyle(color: HexColor("#ffB0B0B0"),fontSize: _mediaQuery.height*0.030),)),
                        ),
                      ],
                    ),
                  ),
                ),
              )



            ],
          ),
        ),
      ),

    );
  }
}
