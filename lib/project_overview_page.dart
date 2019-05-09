import 'package:flutter/material.dart';
import 'domains.dart';
import 'process_page.dart';

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

    var process1 = Process("C41 Film Development");

    process1.addStep(DevelopStep("Pre-soak"));
    process1.addStep(DevelopStep("Develop"));
    process1.addStep(DevelopStep("Blix"));
    process1.addStep(DevelopStep("Stabilizer"));

    var process2 = Process("E6 Film Development");

    processes.add(process1);
    processes.add(process2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: processes.length,
          itemBuilder: (BuildContext ctxt, int index) {
            var process = processes[index];
            return InkWell(
              onTap: () => _onProcessCardPressed(process),
              child: Card(
                margin: EdgeInsets.all(10.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      title: Text(
                        process.name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(Icons.camera, color: Colors.white),
                      subtitle: Text(
                        process.duration.toString(),
                        style: TextStyle(
                          color: Colors.white
                        )
                      ),
                    )
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddNewProcess,
        tooltip: 'Add new process',
        child: Icon(Icons.add),
      ),
    );
  }


  void _onAddNewProcess() {
  }

  void _onProcessCardPressed(Process process) {
    Navigator.push(context, new MaterialPageRoute(builder: (ctx) {
      return ProcessDetailedPage(process: process);
    }));
  }
}