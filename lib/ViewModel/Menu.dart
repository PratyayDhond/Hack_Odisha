import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../community.dart';
import '../motivation.dart';
import '../overcome.dart';
import '../quotes.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
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
                              Navigator.push(context,MaterialPageRoute(
                                builder: (context) => Community(),
                              ));
                            },
                            child: Card(
                              color: HexColor("#ff231539"),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage('assets/community.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          height: _mediaQuery.height*0.30,
                          width: _mediaQuery.width*0.42,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: _mediaQuery.width*0.03),
                          child: Text('Community',style: TextStyle(color: HexColor("#ffB0B0B0"),fontWeight: FontWeight.w500,fontSize: _mediaQuery.height*0.02),),
                        )
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
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Quotes(),
                               ),
                              );
                            },
                            child: Card(
                              color: HexColor("#ff231539"),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image(
                                    image: AssetImage('assets/quotes.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          height: _mediaQuery.height*0.30,
                          width: _mediaQuery.width*0.42,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: _mediaQuery.width*0.03),
                          child: Text('Quotes',style: TextStyle(color: HexColor("#ffB0B0B0"),fontWeight: FontWeight.w500,fontSize: _mediaQuery.height*0.02),),
                        )
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
                                Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) => Overcome(),
                                    ),
                                );
                              },
                              child: Card(
                                color: HexColor("#ff231539"),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: AssetImage('assets/overcome-addiction.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            height: _mediaQuery.height*0.30,
                            width: _mediaQuery.width*0.42,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: _mediaQuery.width*0.03),
                            child: Text('Overcome addiction',style: TextStyle(color: HexColor("#ffB0B0B0"),fontWeight: FontWeight.w500,fontSize: _mediaQuery.height*0.02),),
                          )
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
                                Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) => Motivation()
                                    ));
                              },
                              child: Card(
                                color: HexColor("#ff231539"),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image(
                                      image: AssetImage('assets/motivation.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            height: _mediaQuery.height*0.30,
                            width: _mediaQuery.width*0.42,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: _mediaQuery.width*0.03),
                            child: Text('Motivation',style: TextStyle(color: HexColor("#ffB0B0B0"),fontWeight: FontWeight.w500,fontSize: _mediaQuery.height*0.02),),
                          )
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
