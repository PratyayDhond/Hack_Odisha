import 'package:cloud_firestore/cloud_firestore.dart';
class check{
  static bool isOnboarded = false;
  static bool isSubscribed = false;

  static isSubscribedCheck() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    DocumentSnapshot snapshot = await firebaseFirestore.collection('users').doc('EMAWBkmVwvakrPqA3MHC').get();
    check.isSubscribed = snapshot['sendNewsLetters'];
  }
}