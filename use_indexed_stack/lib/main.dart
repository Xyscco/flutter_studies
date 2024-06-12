import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgets = [
    FirstWidget(key: UniqueKey()),
    SecondWidget(key: UniqueKey()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addWidget() {
    setState(() {
      _widgets.add(ThirdWidget(key: UniqueKey()));
      _selectedIndex = _widgets.length - 1;
    });
  }

  void _removeWidget() {
    if (_widgets.length > 2) {
      setState(() {
        _widgets.removeLast();
        _selectedIndex = _widgets.length - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IndexedStack Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addWidget,
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: _removeWidget,
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(_widgets.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Widget ${index + 1}',
          );
        }),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FirstWidget extends StatefulWidget {
  const FirstWidget({required Key key}) : super(key: key);

  @override
  _FirstWidgetState createState() => _FirstWidgetState();
}

class _FirstWidgetState extends State<FirstWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('First Widget Counter: $_counter'),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: Text('Increment'),
          ),
        ],
      ),
    );
  }
}

class SecondWidget extends StatefulWidget {
  const SecondWidget({required Key key}) : super(key: key);

  @override
  _SecondWidgetState createState() => _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Second Widget Counter: $_counter'),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: Text('Increment'),
          ),
        ],
      ),
    );
  }
}

class ThirdWidget extends StatefulWidget {
  const ThirdWidget({required Key key}) : super(key: key);

  @override
  _ThirdWidgetState createState() => _ThirdWidgetState();
}

class _ThirdWidgetState extends State<ThirdWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Third Widget Counter: $_counter'),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: Text('Increment'),
          ),
        ],
      ),
    );
  }
}
