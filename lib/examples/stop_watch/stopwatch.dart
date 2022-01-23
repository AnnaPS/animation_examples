import 'package:animation_examples/examples/stop_watch/reset_button.dart';
import 'package:animation_examples/examples/stop_watch/start_stop_button.dart';
import 'package:animation_examples/examples/stop_watch/stop_watch_renderer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch>
    with SingleTickerProviderStateMixin {
  bool _isRunning = false;
  late final Ticker _ticker;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentElapsed = Duration.zero;
  Duration get _elapsed => _previouslyElapsed + _currentElapsed;
  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentElapsed = elapsed;
      });
    });
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stop Watch'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: AspectRatio(
            aspectRatio: .80,
            child: LayoutBuilder(builder: (context, constraints) {
              final _radius = constraints.maxWidth / 2;
              return Stack(
                children: [
                  StopWatchRenderer(
                    elapsed: _elapsed,
                    radius: _radius,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: ResetButton(
                        onPressed: _reset,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: StartStopButton(
                        isRunning: _isRunning,
                        onPressed: _toggleStartStopButton,
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  void _toggleStartStopButton() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsed += _currentElapsed;
        _currentElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();

    setState(() {
      _previouslyElapsed = Duration.zero;
      _currentElapsed = Duration.zero;
      _isRunning = false;
    });
  }
}
