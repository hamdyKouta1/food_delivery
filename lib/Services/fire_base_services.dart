
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class Services{

  final auth=FirebaseAuth.instance;
  final storeRealTime=FirebaseDatabase.instance;
  final cloudStore =FirebaseFirestore.instance;

}
