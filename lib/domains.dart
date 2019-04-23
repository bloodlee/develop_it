// Development process
class Process {
  String _name;
  List<Step> _steps = new List<Step>();

  // Constructor
  Process(this._name);

  // getter/setters
  String get name => this._name;

  set name(String newName) => this._name = newName;

  List<Step> get steps => this._steps;
  
  addStep(Step step) => this._steps.add(step);

  insertStep(Step step, int index) {
    if (index >= 0 && index < this._steps.length) {
      this._steps.insert(index, step);
    }
  }
  
  removeStep(Step step) => this._steps.remove(step);
}

// Development step
class Step {
  String _name;

  String _notes = "";

  Duration _duration = new Duration();

  Step(this._name);

  String get name => this._name;

  set name(String newName) => this._name = newName;

  Duration get duration => this._duration;

  set duration(Duration duration) => this._duration = duration;

  String get notes => this._notes;

  set notes(String newNotes) => this._notes = newNotes;
}