import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class Overcome extends StatefulWidget {
  const Overcome({Key? key}) : super(key: key);

  @override
  _OvercomeState createState() => _OvercomeState();
}

class _OvercomeState extends State<Overcome> {

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
                      'Overcome Addiction',
                      style: TextStyle(fontSize: _mediaQuery.height/32,fontWeight: FontWeight.w700,color: HexColor("#ffF31B72")),
                    ),

                    Stepper(
                        steps: steps
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
