import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_odisha/main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'HomePage.dart';
import 'ViewModel/onBoarding_VM.dart';
import 'ViewModel/ShowonBoarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int _noOfPages = 3;
  final PageController pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  String buttonText = "Next";

  List<Widget> _buildPageIndicator(){
    buttonText = _currentPage==2 ? "Let\'s go" : "Next";
    List<Widget> list = [];
    for(int i=0;i<_noOfPages;i++){
      list.add(i==_currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive){

    return AnimatedContainer(duration: Duration(milliseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(color: isActive ? Colors.white : Color(0xFF7B51D31),
      borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
          backgroundColor: HexColor("#ff2B1570"),
          body: Container(
            child: Column(

              children: [
                SizedBox(
                  height: _mediaQuery.height-_mediaQuery.height/10,
                  child: PageView(
                    controller: pageController,
                    physics: ClampingScrollPhysics(),
                    onPageChanged: (int page){
                      setState(() {
                        _currentPage = page;
                        print(pageController);
                      }
                      );
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: _mediaQuery.height/8),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(height: _mediaQuery.height/3.8,image: AssetImage('assets/onboard_one.png')),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: _mediaQuery.height/10,bottom: _mediaQuery.height/90),
                                    child: Text(
                                      'Welcome',
                                      style: TextStyle(fontWeight: FontWeight.w800,color: HexColor('#ffBCB3B3'),fontSize: _mediaQuery.height/22),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(top: _mediaQuery.height/40,left: _mediaQuery.width/20,right: _mediaQuery.width/20),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '"Today is the first day of the rest of your life"\n',
                                          style: TextStyle(
                                              color: HexColor("#ffB0B0B0"),
                                              fontWeight: FontWeight.w700,
                                              fontSize: _mediaQuery.height/33
                                          ),
                                        ),
                                        WidgetSpan(
                                          child: Align(
                                            alignment: Alignment(0.45,0),
                                            child: Text(
                                                '-Charles Dederich',
                                              style: TextStyle(
                                                color: HexColor("#ff0B0B0B0"),
                                                fontWeight: FontWeight.w700,
                                                fontSize: _mediaQuery.height/33
                                              ),
                                            ),
                                          )
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                              ),

                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(top: _mediaQuery.height/18,left: _mediaQuery.width/20,right: _mediaQuery.width/20),
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'We are glad to have you with us.\n',
                                            style: TextStyle(
                                                color: HexColor("#ffB0B0B0"),
                                                fontWeight: FontWeight.w500,
                                                fontSize: _mediaQuery.height/46
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'By installing this app you have already set yourself in motion for overcoming this addiction.\n',
                                            style: TextStyle(
                                                color: HexColor("#ffB0B0B0"),
                                                fontWeight: FontWeight.w500,
                                                fontSize: _mediaQuery.height/46
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Now Let\'s get over this together!',
                                            style: TextStyle(
                                                color: HexColor("#ffB0B0B0"),
                                                fontWeight: FontWeight.w500,
                                                fontSize: _mediaQuery.height/46
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(height: _mediaQuery.height/2.5,image: AssetImage('assets/onboard_two.png')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Commit',
                                  style: TextStyle(fontWeight: FontWeight.w800,color: HexColor('#ffBCB3B3'),fontSize: _mediaQuery.height/22),
                                ),
                              ],
                            ),
                            Container(
                              child: Padding(
                                  padding: EdgeInsets.only(top: _mediaQuery.height/40,left: _mediaQuery.width/20,right: _mediaQuery.width/20),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '"70% of people fail to achieve their goals because of not committing."\n',
                                          style: TextStyle(
                                              color: HexColor("#ffB0B0B0"),
                                              fontWeight: FontWeight.w700,
                                              fontSize: _mediaQuery.height/33
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),

                            Container(
                              child: Padding(
                                  padding: EdgeInsets.only(top: _mediaQuery.height/48,left: _mediaQuery.width/20,right: _mediaQuery.width/20),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Let\'s get started by committing to the goal of staying sober for 90 days',
                                          style: TextStyle(
                                              color: HexColor("#ffB0B0B0"),
                                              fontWeight: FontWeight.w500,
                                              fontSize: _mediaQuery.height/44
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            )

                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(height: _mediaQuery.height/2.5,image: AssetImage('assets/onboard_three.png')),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Start',
                                  style: TextStyle(fontWeight: FontWeight.w800,color: HexColor('#ffBCB3B3'),fontSize: _mediaQuery.height/22),
                                ),
                              ],
                            ),
                            Container(
                              child: Padding(
                                  padding: EdgeInsets.only(top: _mediaQuery.height/40,left: _mediaQuery.width/20,right: _mediaQuery.width/20),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '"Until you spread your wings, you\'ll have no idea how far can you fly!"\n',
                                          style: TextStyle(
                                              color: HexColor("#ffB0B0B0"),
                                              fontWeight: FontWeight.w700,
                                              fontSize: _mediaQuery.height/33
                                          ),
                                        ),
                                        WidgetSpan(
                                            child: Align(
                                              alignment: Alignment(0.45,0),
                                              child: Text(
                                                '-Napoleon Bonaparte',
                                                style: TextStyle(
                                                    color: HexColor("#ff0B0B0B0"),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: _mediaQuery.height/33
                                                ),
                                              ),
                                            )
                                        ),
                                      ],
                                    ),

                                  )
                              ),
                            ),

                            Container(
                              child: Padding(
                                  padding: EdgeInsets.only(top: _mediaQuery.height/24,left: _mediaQuery.width/20,right: _mediaQuery.width/20),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'By committing you have taken the leap of faith,\n',
                                          style: TextStyle(
                                              color: HexColor("#ffB0B0B0"),
                                              fontWeight: FontWeight.w500,
                                              fontSize: _mediaQuery.height/44
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'now Trust Yourself and take control over your life again\n',
                                          style: TextStyle(
                                              color: HexColor("#ffB0B0B0"),
                                              fontWeight: FontWeight.w500,
                                              fontSize: _mediaQuery.height/44
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                      ),
                      SizedBox(
                        width: _mediaQuery.width/4,
                        height: _mediaQuery.height/20,
                        child: ElevatedButton(
                          onPressed: (){
                            if (_currentPage >= 2) {
                              FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
                              firebaseFirestore.collection('users').doc('EMAWBkmVwvakrPqA3MHC').set({
                                'isFirstTime' : false,
                                'sendNewsLetters' : false
                              });
                            } 
                            _currentPage < 2 ? _currentPage++ : Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Home())
                            );
                            pageController.nextPage(duration: Duration(milliseconds: 10), curve: Curves.easeIn);
                            setState(() {});
                          },
                          child: Text(
                            '${buttonText}',
                            style: TextStyle(
                              color: HexColor("#ffB0B0B0"),
                              fontSize: _mediaQuery.height/45,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(HexColor("#ff2B1570")),

                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
