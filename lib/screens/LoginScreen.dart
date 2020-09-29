import 'package:flutter/material.dart';
import 'package:todeay/authenticate/googleauthen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/back.jpeg'), fit: BoxFit.fill),
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(130.0, 70.0, 100.0, 50.0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 90, horizontal: 80.0),
                      child: RaisedButton(
                        onPressed: () {
                          SignIn().onGoogleSignIn(context);
                        },
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.mail,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Text(
                              'Sign-In by Google',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(130.0, 50.0, 110.0, 50.0),
                    child: Text(
                      'NOTES',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
