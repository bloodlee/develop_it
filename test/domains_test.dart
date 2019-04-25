import "package:test_api/test_api.dart";

import "package:develop_it/domains.dart";

void main() {
  test("Create new process", () {
    var process = new Process("C41 development");

    expect("C41 development", process.name);
    expect(0, process.steps.length);

    process.name = "C41 New";

    expect("C41 New", process.name);

    var step1 = new DevelopStep("develop");
    var step2 = new DevelopStep("blix");

    process.addStep(step1);
    process.addStep(step2);

    expect(2, process.steps.length);

    var step3 = new DevelopStep("stabilizer");
    process.insertStep(step3, 0);

    expect(3, process.steps.length);

    process.removeStep(step2);

    expect(2, process.steps.length);
  });
}