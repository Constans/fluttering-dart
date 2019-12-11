import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/rendering.dart';
import 'package:snowfall/snowflakes_painter.dart';
import 'package:snowfall/snowflake_model.dart';

class Snowflakes extends StatefulWidget {
  final int numberOfSnowflakes;

  Snowflakes(this.numberOfSnowflakes);

  @override
  _SnowflakesState createState() => _SnowflakesState();
}

class _SnowflakesState extends State<Snowflakes> {
  final Random random = Random();

  final List<SnowflakeModel> flakes = [];

  @override
  void initState() {
    List.generate(widget.numberOfSnowflakes, (index) {
      flakes.add(SnowflakeModel(random));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Rendering(
      startTime: Duration(seconds: 30),
      onTick: _simulateFlakes,
      builder: (context, time) {
        return CustomPaint(
          painter: SnowflakesPainter(flakes, time),
        );
      },
    );
  }

  _simulateFlakes(Duration time) {
    flakes.forEach((flake) => flake.maintainRestart(time));
  }
}