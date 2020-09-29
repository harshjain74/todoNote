class Task {
  final String name;
  bool isdone;
  String userid;
  Task({this.name, this.isdone = false, this.userid});
  void toggleDone() {
    isdone = !isdone;
  }
}
