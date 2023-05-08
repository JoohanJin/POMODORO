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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

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
  bool isBreak = false;
  int totalPomodoros = 0;
  bool isReset = true;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
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
    setState(() {
      isReset = false;
      if (!timer.isActive) {
        timer.start();
      } else {
        timer.pause();
      }
    });
  }

  void onResetButtonTap() {
    setState(() {
      // timer.cancel(); // timer cannot be used again after it is cancelled
      timer.reset();
      isReset = true;
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
                      //timer selection button
                      children: const [],
                    ),
                  ),
                  if (isReset)
                    Center(
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: onPlayPauseTap,
                        icon: const Icon(
                          Icons.play_arrow_rounded,
                          size: 50,
                        ),
                      ),
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onPlayPauseTap,
                          icon: Icon(
                            timer.isActive
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: 50,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: onResetButtonTap,
                          icon: const Icon(
                            Icons.square_rounded,
                            size: 40,
                          ),
                        )
                      ],
                    )
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
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
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
