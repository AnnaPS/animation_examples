import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: TweenAnimationBuilderPage(),
        ),
      ),
    );
  }
}

class TweenAnimationBuilderPage extends StatelessWidget {
  const TweenAnimationBuilderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TweenAnimationBuilder'),
      ),
      body: const Center(
        child: HSVColorSelector(),
      ),
    );
  }
}

class HSVColorSelector extends StatefulWidget {
  const HSVColorSelector({Key? key}) : super(key: key);

  @override
  _HSVColorSelectorState createState() => _HSVColorSelectorState();
}

class _HSVColorSelectorState extends State<HSVColorSelector> {
  var _hue = 360.0;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: _hue),
      duration: const Duration(milliseconds: 1500),
      builder: (context, double hue, child) {
        final hsvColor = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: hsvColor.toColor(),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Slider.adaptive(
                activeColor: hsvColor.toColor(),
                value: _hue,
                min: 0,
                max: 360,
                onChanged: (newHue) => setState(() => _hue = newHue),
              ),
            )
          ],
        );
      },
    );
  }
}
