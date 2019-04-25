import 'package:flutter/material.dart';
import 'package:develop_it/domains.dart';

class ProcessDetailedPage extends StatefulWidget {

  // static const String routeName = "/process_detailed_page";

  final Process process;

  ProcessDetailedPage({Key key, this.process}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProcessDetailedPageState();

}

class _ProcessDetailedPageState extends State<ProcessDetailedPage> {

  Process _process;

  @override
  Widget build(BuildContext context) {
    this._process = widget.process;

    var backBtn =
        IconButton(icon: new Icon(Icons.arrow_back), onPressed: _onBackPressed);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.process.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              _onStartTimer();
            },
          )
        ],
      ),
      body: new ListView.builder(
        itemCount: _process.steps.length,
          itemBuilder: (BuildContext ctxt, int index) {
            var step = _process.steps[index];
            return InkWell(
              onTap: () => print('clicked on a process'),
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
                      step.name,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.camera, color: Colors.white),
                    subtitle: Text(
                      step.duration.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                )
              )
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAddNewStep,
        tooltip: 'Add new step',
        child: Icon(Icons.add),
      ),
    );
  }


  void _onBackPressed() {
    Navigator.pop(context);
  }

  void _onAddNewStep() {
  }

  void _onStartTimer() {}
}