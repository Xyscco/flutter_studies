import 'package:flutter/material.dart';
import 'package:flutter_nv1_widget_personalizado/controllers/posts_controller.dart';
import '../widgets/button.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  final PostsController _postsController = PostsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: Listenable.merge(
                    [_postsController.posts, _postsController.inLoader]),
                builder: (_, __) => _postsController.inLoader.value
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _postsController.posts.value.length,
                        itemBuilder: (_, idx) => ListTile(
                          title: Text(_postsController.posts.value[idx].title),
                        ),
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                disabled: false,
                onPressed: () => _postsController.callAPI(),
                title: 'Button',
              ),
            ],
          ),
        ),
      )),
    );
  }
}
