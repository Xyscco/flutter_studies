import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  List<Widget> _widgets = [];

  @override
  void initState() {
    super.initState();
    _widgets = [
      FirstWidget(key: UniqueKey(), onRemove: (index) => _removeWidget(index)),
      SecondWidget(key: UniqueKey(), onRemove: (index) => _removeWidget(index)),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addWidget() {
    setState(() {
      _widgets.add(ThirdWidget(
        key: UniqueKey(),
        onRemove: (index) => _removeWidget(index),
      ));
      _selectedIndex = _widgets.length - 1;
    });
  }

  void _removeWidget(int index) {
    setState(() {
      if (_widgets.length > 1) {
        _widgets.removeAt(index);
        if (_selectedIndex >= _widgets.length - 1) {
          _selectedIndex = _widgets.length - 1;
        }
      }
    });
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
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgets.asMap().entries.map((entry) {
          int index = entry.key;
          Widget widget = entry.value;
          return _buildRemovableWidget(widget, index);
        }).toList(),
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

  Widget _buildRemovableWidget(Widget widget, int index) {
    return Stack(
      children: [
        widget,
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.red),
            onPressed: () => _removeWidget(index),
          ),
        ),
      ],
    );
  }
}

class FirstWidget extends StatefulWidget {
  final Function(int) onRemove;

  const FirstWidget({required Key key, required this.onRemove}) : super(key: key);

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
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}

class SecondWidget extends StatefulWidget {
  final Function(int) onRemove;

  const SecondWidget({required Key key, required this.onRemove}) : super(key: key);

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
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}

class ThirdWidget extends StatefulWidget {
  final Function(int) onRemove;

  const ThirdWidget({required Key key, required this.onRemove}) : super(key: key);

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
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
