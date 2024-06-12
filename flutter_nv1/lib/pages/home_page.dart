import 'package:flutter/material.dart';
import './pageViews/one_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int indexBottonNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Francisco'),
              accountEmail: Text('xyscco@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Text('F'),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(0);
                Navigator.pop(context);
                setState(() {
                  indexBottonNavigationBar = 0;
                });
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(1);
                Navigator.pop(context);
                setState(() {
                  indexBottonNavigationBar = 1;
                });
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _pageController.jumpToPage(2);
                Navigator.pop(context);
                setState(() {
                  indexBottonNavigationBar = 2;
                });
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          const OnePage(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottonNavigationBar,
        onTap: (int page) {
          setState(() {
            indexBottonNavigationBar = page;
          });
          _pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Item 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Item 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Item 3',
          ),
        ],
      ),
    );
  }
}
