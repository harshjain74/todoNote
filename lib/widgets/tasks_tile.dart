import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final Function onlongpress;
  final String tasktitle;
  final bool isMe;
  final Function ontap;
  final Function checkBoxCallback;
  final Function leadingbutton;

  TaskTile({
    this.isChecked,
    this.tasktitle,
    this.onlongpress,
    this.checkBoxCallback,
    this.leadingbutton,
    this.isMe,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      title: Text(
        tasktitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          //  fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onLongPress: onlongpress,
      leading: IconButton(
          icon: Icon(
            Icons.delete,
          ),
          onPressed: leadingbutton),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkBoxCallback),
    );
  }
}
