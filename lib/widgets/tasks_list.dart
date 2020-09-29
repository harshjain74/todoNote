import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todeay/screens/describe.dart';
import 'package:todeay/widgets/tasks_tile.dart';
import 'package:todeay/screens/retype_bottom.dart';

final _firestore = FirebaseFirestore.instance;

class TaskList extends StatefulWidget {
  final String usr;
  TaskList({this.usr});
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    print('deactivate');
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('notes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }

        final messages = snapshot.data.docs.reversed;
        List<TaskTile> messageWidgets = [];
        for (var message in messages) {
          final messagetitle = message.data()['title'];
          final messagecheckbox = message.data()['checkbox'];
          final messagesender = message.data()['user'];
          //final currentUser = Db().getCurrentUser();
          final messageDescribe = message.data()['describe'];

          final isMe = widget.usr == messagesender;

          //  number = isMe ? number + 1 : number;

          final messageWidget = TaskTile(
            isChecked: messagecheckbox,
            tasktitle: messagetitle,
            onlongpress: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => ReBottomScreen(
                        id: message.id,
                        olddescribe: messageDescribe,
                        oldtitle: messagetitle,
                      ));
            },
            checkBoxCallback: (value) {
              _firestore
                  .collection('notes')
                  .doc(message.id)
                  .update({'checkbox': value});
            },
            leadingbutton: () async {
              await _firestore.collection('notes').doc(message.id).delete();
            },
            isMe: widget.usr == messagesender,
            ontap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => Describe(
                        data: messageDescribe,
                        title: messagetitle,
                      ));
            },
          );
          if (isMe) {
            messageWidgets.add(messageWidget);

            // notifyListeners();
          }
        }

        return ListView(
          reverse: false,

          // padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          children: messageWidgets.length == 0
              ? [
                  TaskTile(
                    isChecked: false,
                    tasktitle: 'No Notes',
                    onlongpress: null,
                    checkBoxCallback: null,
                    leadingbutton: null,
                    isMe: true,
                    ontap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Describe(
                          data: 'Please add note!',
                          title: 'No Notes',
                        ),
                      );
                    },
                  )
                ]
              : messageWidgets,
        );
      },
    );
  }
}
