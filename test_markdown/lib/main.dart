import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Map<String, String> separateProtocolAndAddress(String url) {
    Uri uri = Uri.parse(url);
    return {
      'protocol': uri.scheme,
      'address': uri.host,
    };
  }

  Future<void> _launchInBrowser(String url) async {
    Map<String, String> result = separateProtocolAndAddress(url);
    print(result);
    Uri uri =
        Uri(scheme: result['protocol'], host: result['address'], path: '');

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var markdown = """
# <center> Ajuda </center>

- Nova Ajuda

---

> Bloco de notas

[Link](https://www.pub.dev)

*Italic* com *

_Italic_ com _

**Bold**	com *

__Bold__ com _

![Image](https://commonmark.org/help/images/favicon.png)

`Inline code` with backticks

```
# code block
print '3 backticks or'
print 'indent 4 spaces'
```

<details>
<summary>Clique aqui para exibir</summary>
texto oculto
</details>
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
              code: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  backgroundColor: Colors.grey),
              codeblockPadding: const EdgeInsets.all(8),
              img: const TextStyle(fontSize: 15),
              codeblockDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
            ),
            onTapLink: (_, href, __) {
              _launchInBrowser(href!);
            },
          ),
        ));
  }
}
