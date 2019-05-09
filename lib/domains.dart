// Development process
class Process {
  String _name;
  List<DevelopStep> _steps = new List<DevelopStep>();

  // Constructor
  Process(this._name);

  // getter/setters
  String get name => this._name;

  set name(String newName) => this._name = newName;

  List<DevelopStep> get steps => this._steps;
  
  addStep(DevelopStep step) => this._steps.add(step);

  insertStep(DevelopStep step, int index) {
    if (index >= 0 && index < this._steps.length) {
      this._steps.insert(index, step);
    }
  }
  
  removeStep(DevelopStep step) => this._steps.remove(step);

  Duration get duration {
    Duration total = Duration(seconds: 0);

    steps.forEach((step) => total += step.duration);

    return total;
  }
}

enum StepType {
  periordically,

}

enum TriggerNextType {
  WAIT_FOR_CLICK,


}

// Development step
class DevelopStep {
  String _name;

  String _notes = "";

  Duration _duration = Duration(seconds: 10);

  DevelopStep(this._name);

  String get name => this._name;

  set name(String newName) => this._name = newName;

  Duration get duration => this._duration;

  set duration(Duration duration) => this._duration = duration;

  String get notes => this._notes;

  set notes(String newNotes) => this._notes = newNotes;
}