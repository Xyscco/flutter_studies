import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Abas(),
    );
  }
}

class Abas extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {'descricao': 'Page One', 'widget': const PageOne()},
    {'descricao': 'Page Two', 'widget': const PageTwo()}
  ];

  Abas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 35,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue.shade100,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(items.length, (index) {
                return SizedBox(
                  width: 93,
                  height: 23,
                  child: Card(
                    elevation: BorderSide.strokeAlignCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            items[index]['descricao'].toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.normal),
                          ),
                          const Text(
                            'X',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        Container(
          height: 50,
          color: Colors.blue.shade700,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    print('Adicionar');
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 246, 248, 250),
            child: const Center(
              child: Text(
                'This row fills the remaining space',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        ),
        Container(
          height: 23,
          color: Colors.blue.shade100,
        ),
      ],
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 246, 248, 250),
      child: const Center(
        child: Text(
          'PAGE ONE',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 246, 248, 250),
      child: const Center(
        child: Text(
          'PAGE ONE',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }
}
