import 'package:flutter/material.dart';
import 'package:pausable_timer/pausable_timer.dart';

import '../widgets/timer_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _fiveMinutesToSeconds = 300; // for breaktime
  static const _fifteenMinutesToSeconds = 900;
  static const _twentyMinutesToSeconds = 1200;
  static const _twentyFiveMinutesToSeconds = 1500;
  static const _thirtyMinutesToSeconds = 1800;
  static const _thirtyFiveMinutesToSeconds = 2100;

  static const listOfMinutes = [
    _fifteenMinutesToSeconds,
    _twentyMinutesToSeconds,
    _twentyFiveMinutesToSeconds,
    _thirtyMinutesToSeconds,
    _thirtyFiveMinutesToSeconds,
  ];

  static final int _defaultSeconds =
      listOfMinutes[2]; // default minute is 25 mins
  int displaySeconds = _defaultSeconds;
  late PausableTimer timer = PausableTimer(
    const Duration(seconds: 1),
    onTick,
  ); //let's initialize the timer
  bool started = false;
  bool isBreak = false;
  int totalPomodoros = 0;

  @override
  void initState() {
    super.initState();
  }

  String timerFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2);
  }

  void onTick() {
    setState(() {
      displaySeconds--;

      if (displaySeconds >= 0) {
        timer
          ..reset()
          ..start();
      }
    });
  }

  void onPlayPauseTap() {
    started = !started;
    setState(() {
      if (started) {
        timer.start();
      } else {
        timer.pause();
      }
    });
  }

  void onResetButtonTap() {
    started = false;
    setState(() {
      timer.pause();
      displaySeconds = _defaultSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "POMODORO",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TimerCard(
                        displaySeconds:
                            timerFormat(displaySeconds).substring(0, 2),
                      ),
                      const Text(
                        ":",
                        style: TextStyle(fontSize: 80),
                      ),
                      TimerCard(
                          displaySeconds:
                              timerFormat(displaySeconds).substring(3, 5)),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      children: const [],
                    ),
                  ),
                  !started
                      ? Center(
                          child: IconButton(
                            onPressed: onPlayPauseTap,
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                              size: 60,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: onPlayPauseTap,
                              icon: const Icon(
                                Icons.pause_rounded,
                                size: 60,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.square_rounded,
                                size: 50,
                              ),
                            )
                          ],
                        )
                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      started ? IconButton(
                            onPressed = onPlayPauseTap,
                            icon = const Icon(Icons.play_arrow_rounded),
                          ) : 
                      /*IconButton(
                        // maybe need to change ->
                        onPressed: onPlayPauseTap,
                        icon: Icon(started
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded),
                        iconSize: 60,
                      ),*/
                    ],
                  ),*/
                ], // Column Children
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
