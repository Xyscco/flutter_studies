import 'package:flutter/material.dart';
import 'package:flutter_layout/models/widget.dart';
import 'package:flutter_layout/widgets/widgetOne.dart';
import 'package:flutter_layout/widgets/widgetTwo.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WidgetModel> widgets = [
    WidgetModel(
        idWidget: const Uuid().v4(),
        descricao: 'Widget One',
        widget: const WidgetOne(),
        ativo: false),
    WidgetModel(
        idWidget: const Uuid().v4(),
        descricao: 'Widget Two',
        widget: const WidgetTwo(),
        ativo: false)
  ];

  int widgetIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  void addWidget() {
    setState(() {
      widgets.add(WidgetModel(
          idWidget: const Uuid().v4(),
          descricao: 'Widget Two 2',
          widget: const WidgetTwo(),
          ativo: false));
    });
  }

  void removeWidget(index) {
    setState(() {
      widgets.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Testes de uso da barra de abas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            // TabBar
            SizedBox(
              width: double.infinity,
              height: 80,
              child: ListView.builder(
                itemCount: widgets.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widgetIndex = index;
                          });
                        },
                        child: Row(
                          children: [
                            Text(widgets[index].descricao),
                            IconButton(
                                onPressed: () {
                                  removeWidget(index);
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            IndexedStack(
              index: widgetIndex,
              children:
                  widgets.map((widgetModel) => widgetModel.widget).toList(),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          child: const Icon(Icons.add),
          onPressed: () {
            addWidget();
          },
        ),
      ),
    );
  }
}
