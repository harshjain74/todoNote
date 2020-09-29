/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/widgets/tasks_tile.dart';

class BrewList extends StatefulWidget {
  final String curntusr;
  BrewList(this.curntusr);
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Task>>(context);
    print(brews);
    return ListView.builder(
      itemCount: 0,
      itemBuilder: (BuildContext context, int index) {
        return brews[index].userid == widget.curntusr
            ? TaskTile(
                tasktitle: brews[index].name,
                isChecked: brews[index].isdone,
                checkBoxCallback: null,
                longPressCallback: null,
              )
            : null;
      },
    );
  }
}
*/
