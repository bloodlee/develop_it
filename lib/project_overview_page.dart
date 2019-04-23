import 'package:flutter/material.dart';
import 'domains.dart';

class ProjectOverviewPage extends StatefulWidget {
  ProjectOverviewPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _ProjectOverviewPageState();

}

class _ProjectOverviewPageState extends State<ProjectOverviewPage> {

  List<Process> processes = [];

  @override
  void initState() {
    super.initState();

    var process1 = new Process("C41 Film Development");
    var process2 = new Process("E6 Film Development");

    processes.add(process1);
    processes.add(process2);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new ListView.builder(
          itemCount: processes.length,
          itemBuilder: (BuildContext ctxt, int index) {
            var process = processes[index];
            return new Card(
              margin: new EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  title: Text(
                    process.name,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(Icons.camera, color: Colors.blue)
                )
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add new process',
        child: Icon(Icons.add),
      ),
    );
  }

}