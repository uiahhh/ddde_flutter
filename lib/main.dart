import 'package:ddde_app/update_worktime_counter.dart';
import 'package:ddde_app/worktime_counter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //usar ModularState para fazer com injection
  WorktimeCounterStore _store = new WorktimeCounterStore(
      new UpdateWorktimeCounter(),
      new ResetWorktimeCounter(),
      new IncrementWorktimeCounter());

  //int _counter = 0;

  void _resetCounter() {
    _store.resetCounter();
  }

  void _incrementCounter() {
    //_counter++;
    //_store.setCounter(_counter);
    _store.incrementCounter();
  }

  Widget _buildCounter(WorktimeCounterState state) {
    int counter = state.counter;
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: _resetCounter,
              child: Text("Reset"),
            ),
            Text('You have pushed the button this many times:'),
            ScopedBuilder(
              store: _store,
              onState: (context, state) => _buildCounter(state),
              //onError: (context, error) => _buildError(error),
              onLoading: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
