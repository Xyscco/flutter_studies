import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IndexedStackExample(),
    );
  }
}

class IndexedStackExample extends StatefulWidget {
  @override
  _IndexedStackExampleState createState() => _IndexedStackExampleState();
}

class _IndexedStackExampleState extends State<IndexedStackExample> {
  int _selectedIndex = 0;
  List<Widget> _pages = [];
  List<int> _keys = [];

  @override
  void initState() {
    super.initState();
    _keys = List<int>.generate(
        5, (index) => index); // Cria chaves únicas para os widgets
    _pages =
        _keys.map((key) => MyPage(key: ValueKey(key), index: key)).toList();
  }

  void _removePage() {
    setState(() {
      if (_pages.length > 1) {
        _pages.removeAt(_selectedIndex);
        _keys.removeAt(_selectedIndex);
        if (_selectedIndex >= _pages.length) {
          _selectedIndex = _pages.length - 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IndexedStack Example'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: List.generate(_pages.length, (index) {
          return BottomNavigationBarItem(
            label: 'Page $index',
            icon: Icon(Icons.pages),
          );
        }),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _removePage,
        child: Icon(Icons.remove),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  final Key key;
  final int index;

  MyPage({required this.key, required this.index}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Page ${widget.index}'),
          Text('Counter: $_counter'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: Text('Increment'),
          ),
        ],
      ),
    );
  }
}
