import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'ViewModel/ShowonBoarding.dart';

class Overcome extends StatefulWidget {
  const Overcome({Key? key}) : super(key: key);

  @override
  _OvercomeState createState() => _OvercomeState();
}

class _OvercomeState extends State<Overcome> {
  var _currentStep = 0;
  String username="",mail="";
  bool subscribed = check.isSubscribed;
  TextEditingController  usernameController = TextEditingController();
  TextEditingController  mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: HexColor("#ff130B20"),
      appBar: AppBar(
        backgroundColor: HexColor("#ff130B20"),
        elevation: 0,
        title: Text('Overcome Addiction',
        style: TextStyle(
            color: HexColor("#FFF31B72"),
            fontSize: _mediaQuery.width*0.06
           ),
        ),
        centerTitle: true,
        leading: Column(
          children: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,color: HexColor('#FFF31B72'),),
              color: HexColor('#ff130B20'),
            ),
          ],
        ),
      ),
      body: Theme(
          data: ThemeData(
            accentColor: HexColor("#FFF31B72"),
            primaryColor: HexColor("#FFF31B72"),
            colorScheme: ColorScheme.light(
              primary: HexColor("#FFF31B72"),

            )
          ),
        child: SingleChildScrollView(
          child: !subscribed ? Column(
            children: [
              Padding(
                padding: EdgeInsets.all(_mediaQuery.height*0.03),
                child: Text(
                  'Overcome the addiction by signing up for our weekly newsletter',
                  style: TextStyle(color: HexColor("#ffB0B0B0"),fontSize: _mediaQuery.height*0.03),
                ),
              ),
              Stepper(
                  type : StepperType.vertical,
                  currentStep : _currentStep,

                  onStepContinue : _currentStep < 2 ?
                      () => setState(() => _currentStep += 1) : null,
                  onStepCancel : _currentStep > 0 ?
                      () => setState(() => _currentStep -= 1) : null,

                  steps : [
                    Step(
                        title : Text("What should we call you?",
                          style: TextStyle(color: HexColor("#ffB0B0B0"))
                          ,), isActive : true,
                        content : TextFormField(
                          controller: usernameController,
                          style: TextStyle(
                            color: HexColor("#ffF31B72"),
                          ),
                          onSaved: (string){
                            print(string);
                            username = usernameController.text;
                            },
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.person),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: HexColor('#FFF31B72')
                            )
                          ),

                        )
                    ),
                    Step(
                        title : Text("Where should we contact you?",
                          style: TextStyle(color: HexColor("#ffB0B0B0"))
                          ,), isActive : true,
                        content : TextFormField(
                          controller: mailController,
                          style: TextStyle(
                            color: HexColor("#ffF31B72"),
                          ),
                          onSaved: (string){
                            print(string);
                            mail = mailController.text;
                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.person),
                              labelText: 'Mail id',
                              labelStyle: TextStyle(
                                  color: HexColor('#FFF31B72')
                              ),
                              hintText: 'abc@xyz.com',
                              hintStyle: TextStyle(
                                  color: HexColor('#FFF31B72')
                              )
                          ),

                        )
                    ),
                    Step(
                        title : Text("Great!",style: TextStyle(color: HexColor("#ffB0B0B0"))), isActive : true,
                        subtitle: Text('Now Click on Submit to complete signing up',style: TextStyle(color: HexColor("#ffB0B0B0"),fontSize: _mediaQuery.height*0.02)),
                      content : ElevatedButton(
                          child: Text('Submit'),
                          onPressed: () async {
                            setState(){}
                            mail = mailController.text;
                            username = usernameController.text;
                            print(mail +1.toString() + username);
                            if(mail == "" || username ==""){
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Text('Fields cannot be empty')
                                )
                              );
                            }else{
                              if(mail.contains("@",0)){

                                if(mail.contains(".",0)){
                                    await FirebaseFirestore.instance.collection('newsletter').add({
                                      'username' : username,
                                      'mail'     : mail
                                        });
                                    await FirebaseFirestore.instance.collection('users').doc('EMAWBkmVwvakrPqA3MHC').set({
                                      'sendNewsLetters' : true,
                                      'isFirstTime'     : false
                                    });

                                    Navigator.pop(context);
                                    check.isSubscribedCheck();
                                    setState(){}
                                }else{
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                          content: Text('Enter a valid mail id')
                                      )
                                  );
                                }
                              }else{
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                        content: Text('Enter a valid mail id')
                                    )
                                );
                              }
                            }

                          }
                        ),
                    )
                  ]
              ),
            ],
          ) : Container(
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/newsletters.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: _mediaQuery.height*0.05,left: _mediaQuery.width*0.08,right: _mediaQuery.width*0.08),
                  child: Text('Uh oh! there are no new newsletters out yet.',style: TextStyle(color: HexColor("#ffB0B0B0"),fontSize: _mediaQuery.height*0.03),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
