import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'functions/quotes.dart';

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
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
                      'Quotes',
                      style: TextStyle(fontSize: _mediaQuery.height/28,fontWeight: FontWeight.w700,color: HexColor("#ffF31B72")),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: _mediaQuery.height*0.9,
              child: ListView.builder(
                  itemCount: JSONquotes.length,
                  itemBuilder: (context,index){
                    return InkWell(
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
                                        '"' + JSONquotes[index]['quote']! +'"',
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
                        padding: EdgeInsets.only(top: _mediaQuery.height*0.05,left: _mediaQuery.width*0.05,right: _mediaQuery.width*0.05),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: HexColor("#ff231539"),
                          ),
                          height: _mediaQuery.height*0.235,
                          width: _mediaQuery.width * 0.8,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: _mediaQuery.width*0.05,vertical: _mediaQuery.height*0.05),
                                child: Text(
                                  '"' + JSONquotes[index]['quote']! +'"',
                                  style: TextStyle(
                                    color: HexColor("#ffB0B0B0"),
                                    fontSize: _mediaQuery.height*0.025,
                                    overflow: TextOverflow.ellipsis
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(left: _mediaQuery.width*0.2,top: _mediaQuery.height*0.03),
                                child: Text(
                                  '-' + JSONquotes[index]['author']!,
                                  style: TextStyle(
                                      color: HexColor("#ffB0B0B0"),
                                      fontSize: _mediaQuery.height*0.025,
                                      overflow: TextOverflow.ellipsis
                                  ),
                                ),
                              )

                            ],
                          )
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
