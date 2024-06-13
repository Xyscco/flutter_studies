import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Markdown Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var markdown = """
# Here's a simple Go program that prints "Hello, world!" to the console😀:

``` 
package main
import "fmt"

func main() {
    fmt.Println("Hello, world!")
} 
```

Save the above code in a file with a ` .go ` extension, for example ` hello.go `. Then, you can run the program by executing the following command in your terminal:

```shell
go run hello.go 
```

The output will be:

```
Hello, world!
```
""";

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Markdown(
            selectable: true,
            data: markdown,
            styleSheet: MarkdownStyleSheet(
              h1: const TextStyle(fontSize: 24, color: Colors.blue),
              code: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  backgroundColor: Colors.grey),
              codeblockPadding: const EdgeInsets.all(8),
              codeblockDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
            ),
          ),
        ));
  }
}
