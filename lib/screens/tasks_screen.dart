import 'package:flutter/material.dart';
import 'package:todeay/screens/LoginScreen.dart';
import 'package:todeay/widgets/tasks_list.dart';
import 'add_Bottom_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'aboutus.dart';

class TaskScreen extends StatefulWidget {
  final User user;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  TaskScreen(this.user, this.googleSignIn, this.auth);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.addObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddBottomScreen(
                    uid: widget.user.uid,
                  ));
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Todo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 120,
              child: DrawerHeader(
                child: Text(
                  widget.user.displayName,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                ),
                padding: EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 30.0),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30.0),
              leading: Text('About Us'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
              focusColor: Colors.blue[300],
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 30.0),
              leading: Text(
                'Signout',
                textAlign: TextAlign.center,
              ),
              onTap: () async {
                widget.googleSignIn.signOut();
                widget.auth.signOut().whenComplete(() {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                });
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Container(
            padding: EdgeInsets.only(top: 60, left: 30, bottom: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),*/
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2.0),
              child: TaskList(
                usr: widget.user.uid,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
