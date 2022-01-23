import 'package:animation_examples/router/router.dart';
import 'package:animation_examples/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 8.0),
          children: const [
            ListTileWidget(
              title: 'Tween Animation Builder',
              routeName: tweenRoute,
            ),
            ListTileWidget(
              title: 'Stop Watch',
              routeName: stopWatchRoute,
            ),
          ],
        ),
      ),
    );
  }
}
