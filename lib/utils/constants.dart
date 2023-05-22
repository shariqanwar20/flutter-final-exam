import 'package:cloud_firestore/cloud_firestore.dart';

class ConnectFirebase{
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
}

class Response {
  int status;
  String message;
  Response({this.status = 0, this.message = ""});
  int get getStatus => status;
  String get getMessage => message;
}
