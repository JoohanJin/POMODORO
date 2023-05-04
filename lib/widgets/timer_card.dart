import 'package:flutter/material.dart';

class TimerCard extends StatefulWidget {
  TimerCard({
    super.key,
    required this.displaySeconds,
  });

  String displaySeconds;

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 140,
      child: Stack(
        fit: StackFit.loose,
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 110,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Positioned(
            top: 5,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              alignment: Alignment.center,
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              child: Text(
                widget.displaySeconds,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 70,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
