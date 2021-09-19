import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';




class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  Future<void> _lauchInBrowser(String url) async {
    if(await canLaunch(url)){
      await(launch(url,forceSafariVC: false,forceWebView: false,
      ));
    }else{
      print('Couldn\'t launch Url');
    }
  }



  @override
  Widget build(BuildContext context) {
    var _mediaQuery  = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor("#FF130B20"),

      bottomNavigationBar: BottomAppBar(
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
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: _mediaQuery.width*0.68),
                  child: IconButton(
                    icon: Icon(Icons.menu, color: HexColor("#ffB0B0B0"),),
                    iconSize: _mediaQuery.height*0.040,
                    onPressed: (){},
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: _mediaQuery.height*0.025,top: _mediaQuery.height*0.025),
              child: Align(
                alignment: Alignment(-0.95,0),
                child: Text(
                  'Menu',
                  style: TextStyle(fontSize: _mediaQuery.height/28,fontWeight: FontWeight.w700,color: HexColor("#ffF31B72")),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: _mediaQuery.height*0.08,left: _mediaQuery.width*0.05,right: _mediaQuery.width*0.05),
              child: Container(
                  child : Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: InkWell(
                              onTap: (){
                                _lauchInBrowser("https://www.reddit.com/r/NoFap/?f=flair_name%3A%22Telling%20my%20Story%22");
                              },
                              child: Card(
                                color: HexColor("#ff231539"),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Success Stories',
                                      style: TextStyle(color: HexColor("#ffB0B0B0"),fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            height: _mediaQuery.height*0.30,
                            width: _mediaQuery.width*0.42,
                          ),
                        ],
                      ),

                      SizedBox(width: _mediaQuery.width*0.050,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: InkWell(
                              onTap: (){
                                _lauchInBrowser("https://www.reddit.com/r/NoFap/?f=flair_name%3A%22success%20Story%22");
                              },
                              child: Card(
                                color: HexColor("#ff231539"),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('My Story',
                                      style: TextStyle(color: HexColor("#ffB0B0B0"),fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            height: _mediaQuery.height*0.30,
                            width: _mediaQuery.width*0.42,
                          ),
                        ],
                      ),
                    ],
                  )
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: _mediaQuery.height*0.02,left: _mediaQuery.width*0.05,right: _mediaQuery.width*0.05),
              child: Container(
                  child : Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: InkWell(
                              onTap: (){
                                _lauchInBrowser("https://www.reddit.com/r/NoFap/hot/?f=flair_name%3A%22Advice%22");
                              },
                              child: Card(
                                color: HexColor("#ff231539"),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Commitment',
                                      style: TextStyle(color: HexColor("#ffB0B0B0"),fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            height: _mediaQuery.height*0.30,
                            width: _mediaQuery.width*0.42,
                          ),
                        ],
                      ),

                      SizedBox(width: _mediaQuery.width*0.050,),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: InkWell(
                              onTap: (){
                                _lauchInBrowser("https://www.reddit.com/r/NoFap/hot/?f=flair_name%3A%22Journal%20Check-In%22");
                              },
                              child: Card(
                                color: HexColor("#ff231539"),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('30 Day Challange',
                                      style: TextStyle(color: HexColor("#ffB0B0B0"),fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            height: _mediaQuery.height*0.30,
                            width: _mediaQuery.width*0.42,
                          ),
                        ],
                      ),
                    ],
                  )
              ),
            )


            // Padding(
            //     padding: EdgeInsets.only(top: _mediaQuery.height*0.02,left: _mediaQuery.width*0.05,right: _mediaQuery.width*0.05),
            // child: Container(
            //   height: _mediaQuery.height*0.7,
            //   width: _mediaQuery.width*0.9,
            //   color: Colors.white,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Row(
            //         children: [
            //           Column(
            //             children: [
            //               SizedBox(
            //                 heigh
            //                 child: Card(
            //                   color: HexColor("#ff231539"),
            //                 ),
            //               ),
            //               Text('Community',style: TextStyl
            //               e(color: HexColor("#ffB0B0B0")),)
            //             ],
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
