library flutter_rainbow_border;

import 'package:flutter/material.dart';
import 'dart:math';

class RainbowBorder extends StatefulWidget {
  final double width;
  final double height;
  final double border;
  final double borderRadius;
  final bool isRotating;
  final double fixedRotation;
  final bool isClockwise;
  final Duration rotationDuration;
  final Color? backgroundColor;
  final Widget? child;

  const RainbowBorder({
    super.key,
    required this.width,
    required this.height,
    this.border = 1.0,
    this.borderRadius = 0.0,
    this.isRotating = true,
    this.fixedRotation = 0.0,
    this.isClockwise = true,
    this.rotationDuration = const Duration(seconds: 3),
    this.backgroundColor,
    this.child,
  });

  @override
  RainbowBorderState createState() => RainbowBorderState();
}

class RainbowBorderState extends State<RainbowBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.rotationDuration,
    );
    if (widget.isRotating) {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? Colors.transparent,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
            CustomPaint(
              size: Size(widget.width, widget.height),
              painter: RainbowBorderPainter(
                rotation: widget.isRotating
                    ? (widget.isClockwise
                            ? _controller.value
                            : -_controller.value) *
                        360
                    : widget.fixedRotation,
                borderWidth: widget.border,
                borderRadius: widget.borderRadius,
              ),
            ),
            if (widget.child != null) widget.child!,
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class RainbowBorderPainter extends CustomPainter {
  final double rotation;
  final double borderWidth;
  final double borderRadius;

  RainbowBorderPainter({
    required this.rotation,
    required this.borderWidth,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final sweepGradient = SweepGradient(
      colors: const [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.indigo,
        Colors.purple,
        Colors.red,
      ],
      stops: const [0, 1 / 7, 2 / 7, 3 / 7, 4 / 7, 5 / 7, 6 / 7, 1],
      transform: GradientRotation((rotation % 360) * (pi / 180)),
    );

    final paint = Paint()
      ..shader = sweepGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          rect.deflate(borderWidth / 2),
          Radius.circular(borderRadius),
        ),
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RainbowBorderPainter oldDelegate) => true;
}
