import 'package:flutter/material.dart';

class Describe extends StatefulWidget {
  final String data;
  final String title;
  Describe({this.data, this.title});
  @override
  _DescribeState createState() => _DescribeState();
}

class _DescribeState extends State<Describe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        // color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: ListView(
          children: [
            Center(
              child: Text(widget.title),
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 10.0,
              thickness: 3.0,
              color: Colors.green,
            ),
            Text(
              widget.data,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
