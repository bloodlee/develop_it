import 'package:flutter/material.dart';
import 'domains.dart';
import 'dart:async';

class CountingDownPage extends StatefulWidget {

  final Process theProcess;

  CountingDownPage({Key key, this.theProcess}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountingDownPageState();

}

class _CountingDownPageState extends State<CountingDownPage> {

  Process _process;

  String totalLeftTime = "";

  DevelopStep currentStep;

  var currentStepDuration = Duration();

  @override
  Widget build(BuildContext context) {
    this._process = widget.theProcess;

    var backBtn = IconButton(icon: new Icon(Icons.arrow_back), onPressed: _onBackPressed);
    return Scaffold(
      appBar: AppBar(
        title: Text(_process.name),
      ),
      body: Card(
        margin: EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0
              ),
            ],
          ),
          child: ListTile(
            title: Text(
              "${currentStep.name}\n$currentStepDuration",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            leading: Icon(Icons.timer, color: Colors.white, size: 40.0,),
            subtitle: Text(
              totalLeftTime,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.pause, color: Colors.white),
        onPressed: () {},
        tooltip: "Pause",
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    const oneSec = const Duration(seconds: 1);
    var totalDuration = widget.theProcess.duration;

    var stepIndex = 0;
    currentStep = widget.theProcess.steps[stepIndex];
    currentStepDuration = currentStep.duration;

    new Timer.periodic(oneSec, (Timer t) {
      totalDuration -= oneSec;
      currentStepDuration -= oneSec;

      if (totalDuration < Duration(seconds: 0)) {
        t.cancel();
      } else {
        if (currentStepDuration < Duration(seconds: 0)) {
          stepIndex++;
          currentStep = widget.theProcess.steps[stepIndex];
          currentStepDuration = currentStep.duration - Duration(seconds: 1);
        }

        setState(() {
          totalLeftTime = "total left time is " + totalDuration.toString();
        });
      }

    });

  }


  void _onBackPressed() {
    Navigator.pop(context);
  }
}