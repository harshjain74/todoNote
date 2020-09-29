import 'package:flutter/material.dart';
import 'package:todeay/database/db.dart';
import 'package:flushbar/flushbar.dart';

class AddBottomScreen extends StatefulWidget {
  AddBottomScreen({this.uid});
  final String uid;
  @override
  _AddBottomScreenState createState() => _AddBottomScreenState();
}

class _AddBottomScreenState extends State<AddBottomScreen> {
  TextEditingController tec = TextEditingController();
  TextEditingController tec2 = TextEditingController();

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
                'Add Task',
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
                    if (tec.text != '') {
                      await Db()
                          .getuserData(tec.text, widget.uid, false, tec2.text)
                          .then((value) {
                        tec.clear();
                        tec2.clear();
                        Navigator.pop(context);
                        Flushbar(
                          flushbarPosition: FlushbarPosition.BOTTOM,
                          message: "Successfully added",
                          backgroundColor: Colors.green[300],
                          duration: Duration(seconds: 5),
                        )..show(context);
                      });
                    } else {
                      Navigator.pop(context);
                      Flushbar(
                        flushbarPosition: FlushbarPosition.BOTTOM,
                        message: "Please type title",
                        backgroundColor: Colors.red[300],
                        duration: Duration(seconds: 5),
                      )..show(context);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                color: Colors.lightBlueAccent,
                child: Text(
                  'Add',
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
