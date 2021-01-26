import 'package:flutter/material.dart';
import 'package:flutter_app/worker/callback.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager.initialize(callbackDispatcher, isInDebugMode: true);

  Workmanager.registerOneOffTask("oneoff", "oneoff",
      tag: "task",
      existingWorkPolicy: ExistingWorkPolicy.append,
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresStorageNotLow: false,
        requiresCharging: false,
        requiresBatteryNotLow: true,
        requiresDeviceIdle: false,
      ),
      inputData: {"name": "One Off"},
      initialDelay: Duration(minutes: 5),
      backoffPolicy: BackoffPolicy.linear,
      backoffPolicyDelay: Duration(minutes: 15));

  Workmanager.registerPeriodicTask("periodic", "periodic",
      tag: "task",
      existingWorkPolicy: ExistingWorkPolicy.append,
      frequency: Duration(minutes: 15),
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresStorageNotLow: false,
        requiresCharging: false,
        requiresBatteryNotLow: true,
        requiresDeviceIdle: false,
      ),
      inputData: {"name": "Periodic"},
      initialDelay: Duration(minutes: 5),
      backoffPolicy: BackoffPolicy.linear,
      backoffPolicyDelay: Duration(minutes: 15));

  Workmanager.registerOneOffTask("immediate_main", "immediate_main",
      tag: "task",
      existingWorkPolicy: ExistingWorkPolicy.append,
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresStorageNotLow: false,
        requiresCharging: false,
        requiresBatteryNotLow: false,
        requiresDeviceIdle: false,
      ),
      inputData: {"name": "Immediate Main"},
      initialDelay: Duration(seconds: 1),
      backoffPolicy: BackoffPolicy.linear,
      backoffPolicyDelay: Duration(minutes: 15));

  print("Its all done...");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void scheduleTask() {
    Workmanager.registerOneOffTask("immediate", "immediate",
        tag: "task",
        existingWorkPolicy: ExistingWorkPolicy.append,
        constraints: Constraints(
          networkType: NetworkType.connected,
          requiresStorageNotLow: false,
          requiresCharging: false,
          requiresBatteryNotLow: false,
          requiresDeviceIdle: false,
        ),
        inputData: {"name": "Immediate Task", "type": "immediate"},
        initialDelay: Duration(seconds: 1),
        backoffPolicy: BackoffPolicy.linear,
        backoffPolicyDelay: Duration(minutes: 15));

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have scheduled a task',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scheduleTask,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
