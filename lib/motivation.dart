import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Motivation extends StatefulWidget {
  const Motivation({Key? key}) : super(key: key);

  @override
  _MotivationState createState() => _MotivationState();
}

Future<void> _lauchInBrowser(String url) async {
  if(await canLaunch(url)){
    await(launch(url,forceSafariVC: false,forceWebView: false,
    ));
  }else{
    print('Couldn\'t launch Url');
  }
}


class _MotivationState extends State<Motivation> {


  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor("#ff130B20"),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: _mediaQuery.height*0.010,top: _mediaQuery.height*0.025),
              child: Align(
                alignment: Alignment(-0.95,0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,color: HexColor("#ffF31B72"),),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Motivation',
                      style: TextStyle(fontSize: _mediaQuery.height/28,fontWeight: FontWeight.w700,color: HexColor("#ffF31B72")),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: StreamBuilder(
                stream: firebaseFirestore.collection('motivation').snapshots(),
                builder: (context,AsyncSnapshot snapshots){
                  if(snapshots.hasData){
                    if(snapshots.data.docs.length > 0){
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshots.data.docs.length,
                          itemBuilder: (context,index){
                            print(snapshots.data.docs[index]['platform']);
                            return Padding(
                                padding: const EdgeInsets.only(top: 4.0,right: 8.0,left: 8.0),
                                child: Container(
                                  height: _mediaQuery.height*0.15,
                                  width: _mediaQuery.width*0.9,
                                  child: InkWell(
                                    onTap: ()async{
                                      await _lauchInBrowser(snapshots.data.docs[index]['url']);
                                    },
                                    child: Card(
                                      color: HexColor("#ff231539"),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: _mediaQuery.width*0.05,top: _mediaQuery.width*0.01),
                                            child: Text(
                                              snapshots.data.docs[index]['title'],style: TextStyle(color: HexColor("#ffB0B0B0"),fontSize: _mediaQuery.height*0.03),),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: _mediaQuery.width*0.05,top: _mediaQuery.width*0.01),
                                            child: Text('Platform : ' +snapshots.data.docs[index]['platform'],style: TextStyle(color: HexColor("#ffB0B0B0")),),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            );
                          });
                    }else{
                      print('We are out of new content');
                      return Container();
                    }
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
