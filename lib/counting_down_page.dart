import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';
import 'domains.dart';

class CountingDownPage extends StatefulWidget {

  final Process theProcess;

  CountingDownPage({Key key, this.theProcess}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountingDownPageState();

}

class _CountingDownPageState extends State<CountingDownPage> {

  @override
  Widget build(BuildContext context) {
    var backBtn = IconButton(icon: new Icon(Icons.arrow_back), onPressed: _onBackPressed);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.theProcess.name),
      ),
      body: Text(
        widget.theProcess.name
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pause, color: Colors.white),
        onPressed: () {},
        tooltip: "Pause",
      ),
    );
  }


  void _onBackPressed() {
    Navigator.pop(context);
  }
}