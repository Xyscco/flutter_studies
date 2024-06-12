import 'package:flutter/material.dart';
import 'package:flutter_nv1_splash_login/controllers/home_controller.dart';
import 'package:flutter_nv1_splash_login/models/post_model.dart';
import 'package:flutter_nv1_splash_login/repositories/home_repository_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 150,
            child: Center(
              child: ValueListenableBuilder<List<PostModel>>(
                valueListenable: _controller.posts,
                builder: (_, list, __) {
                  return ListView.separated(
                    // physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (_, idx) => ListTile(
                      leading: Text(list[idx].id.toString()),
                      title: Text(list[idx].title),
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                    separatorBuilder: (_, __) => const Divider(),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
                onPressed: () => _controller.fetch(),
                child: const Text('Recarregar')),
          )
        ],
      ),
    );
  }
}
