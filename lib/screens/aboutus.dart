import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
        child: Column(
          children: [
            Text(
                'This is a note app in which user can store personal notes.User can create notes by click Add button on right hand side and update their notes by long press on notes.'),
            Padding(
              padding: const EdgeInsets.fromLTRB(90.0, 8.0, 0.0, 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
