import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final _firestore = FirebaseFirestore.instance;
User loggedinUser;

class Db with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  Future<String> getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        return loggedinUser.uid;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('notes').snapshots())
      for (var messages in snapshot.docs) {
        print(messages.data);
      }
  }

  Future getuserData(
      String title, String userid, bool checkbox, String describe) async {
    await _firestore.collection('notes').add({
      'title': title,
      'user': userid,
      'checkbox': checkbox,
      'describe': describe,
    });
  }

  set len(log) {
    return log.length;
  }

  int leng(String log) {
    return log.length;
  }
}
