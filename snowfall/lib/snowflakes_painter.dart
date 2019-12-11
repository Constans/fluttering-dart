import 'package:flutter/material.dart';
import 'package:snowfall/snowflake_model.dart';

class SnowflakesPainter extends CustomPainter {
  List<SnowflakeModel> snowflakes;
  Duration time;

  SnowflakesPainter(this.snowflakes, this.time);

  @override
  void paint(Canvas canvas, Size size) {

    final Paint p = Paint()
      ..color = Colors.white.withAlpha(125)
      ..style = PaintingStyle.fill;

    snowflakes.forEach((snowflake) {
        
      var progress = snowflake.animationProgress.progress(time);
      final animation = snowflake.tween.transform(progress);
      final position =
          Offset(animation["x"] * size.width, animation["y"] * size.height);
      canvas.drawPath(snowflake.path.shift(position), p);

    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}