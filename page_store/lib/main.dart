import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  List<Widget> _pages = [];
  PageStorageBucket _bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pages = [
      FirstPage(key: PageStorageKey('FirstPage')),
      SecondPage(key: PageStorageKey('SecondPage')),
    ];
  }

  void _addPage() {
    setState(() {
      _pages.add(ThirdPage(key: PageStorageKey('ThirdPage')));
    });
  }

  void _removePage() {
    if (_pages.length > 2) {
      setState(() {
        _pages.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView Example'),
      ),
      body: PageStorage(
        bucket: _bucket,
        child: PageView(
          controller: _pageController,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _pageController.hasClients ? _pageController.page!.round() : 0,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: 'Page 3',
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _addPage,
            child: Icon(Icons.add),
            tooltip: 'Add Page',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _removePage,
            child: Icon(Icons.remove),
            tooltip: 'Remove Page',
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('First Page'),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Second Page'),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Third Page'),
    );
  }
}
