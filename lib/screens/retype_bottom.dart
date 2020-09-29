import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flushbar/flushbar.dart';

final _firestore = FirebaseFirestore.instance;

class ReBottomScreen extends StatefulWidget {
  final String id;
  final String oldtitle;
  final String olddescribe;
  ReBottomScreen({this.id, this.oldtitle, this.olddescribe});
  @override
  _ReBottomScreenState createState() =>
      _ReBottomScreenState(this.oldtitle, this.olddescribe);
}

class _ReBottomScreenState extends State<ReBottomScreen> {
  String title;
  String describe;

  TextEditingController tec;
  TextEditingController tec2;

  _ReBottomScreenState(this.title, this.describe) {
    tec = TextEditingController(text: title);
    tec2 = TextEditingController(text: describe);
  }

  @override
  Widget build(BuildContext context) {
    //String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Update Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                ),
              ),
              Center(
                child: Text('Title'),
              ),
              TextField(
                autofocus: false,
                textAlign: TextAlign.center,
                controller: tec,
              ),
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text('Description'),
              ),
              TextField(
                autofocus: false,
                textAlign: TextAlign.center,
                controller: tec2,
              ),
              FlatButton(
                onPressed: () async {
                  try {
                    if ((tec.text != '' && tec.text != null) ||
                        (tec2.text != null && tec2.text != '')) {
                      if (tec.text != null && tec.text != '') {
                        await _firestore
                            .collection('notes')
                            .doc(widget.id)
                            .update({
                          'title': tec.text,
                        }).then((value) {
                          tec.clear();
                        });
                      }
                      if (tec2.text != null && tec2.text != '') {
                        await _firestore
                            .collection('notes')
                            .doc(widget.id)
                            .update({
                          'describe': tec2.text,
                        }).then((value) {
                          tec2.clear();
                        });
                      }

                      Navigator.pop(context);
                      Flushbar(
                        flushbarPosition: FlushbarPosition.BOTTOM,
                        message: "Successfully updated",
                        backgroundColor: Colors.green[300],
                        duration: Duration(seconds: 5),
                      )..show(context);
                    } else {
                      Navigator.pop(context);
                      Flushbar(
                        flushbarPosition: FlushbarPosition.BOTTOM,
                        message: "",
                        backgroundColor: Colors.green[300],
                        duration: Duration(seconds: 5),
                      )..show(context);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                color: Colors.lightBlueAccent,
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
