import 'package:animation_examples/examples/home/home_page.dart';
import 'package:animation_examples/examples/stop_watch/stopwatch.dart';
import 'package:animation_examples/examples/tween_animation_builder/tween_animation_builder.dart';
import 'package:flutter/material.dart';

class RouterUtil {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case tweenRoute:
        return MaterialPageRoute(
          builder: (_) => const TweenAnimationBuilderPage(),
        );

      case stopWatchRoute:
        return MaterialPageRoute(
          builder: (_) => const StopWatch(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

const String homeRoute = '/';
const String tweenRoute = 'tween';
const String stopWatchRoute = 'stop_watch';
