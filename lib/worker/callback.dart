import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  print("Inside callbackDispatcher");
  Workmanager.executeTask((task, inputData) async {
    print("^^^^^^^^^^^^^^^^ Inside executeTask $task and $inputData");

    switch (task) {
      case "immediate":
        print("^^^^^^^^^^^^^^^^^^^^ Inside the immediate");
        break;
      case "periodic":
        print("^^^^^ Inside periodic");
        break;
      case "oneoff":
        print("^^^^^^^^^ One off task");
        break;
      case "immediate_main":
        print("!!! Immedidate from main");
        break;
    }

    return Future.value(true);
  });
}
