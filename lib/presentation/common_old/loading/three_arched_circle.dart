import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'draw_arc.dart';

const double _kGapAngle = math.pi / 12;
const double _kMinAngle = math.pi / 36;

class ThreeArchedCircle extends StatefulWidget {
  final double size;
  final Color color;

  const ThreeArchedCircle({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  State<ThreeArchedCircle> createState() => _ThreeArchedCircleState();
}

class _ThreeArchedCircleState extends State<ThreeArchedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = widget.color;
    final double size = widget.size;
    final double ringWidth = size * 0.08;

    final CurvedAnimation firstRotationInterval = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.5,
        curve: Curves.easeInOut,
      ),
    );

    final CurvedAnimation firstArchInterval = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.0,
        0.4,
        curve: Curves.easeInOut,
      ),
    );

    final CurvedAnimation secondRotationInterval = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.easeInOut,
      ),
    );

    final CurvedAnimation secondArchInterval = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.5,
        0.9,
        curve: Curves.easeInOut,
      ),
    );

    return Container(
      padding: EdgeInsets.all(size * 0.04),
      // color: Colors.green,
      width: size,
      height: size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, __) {
          return _animationController.value <= 0.5
              ? Transform.rotate(
                  angle: Tween<double>(
                    begin: 0,
                    end: 4 * math.pi / 3,
                  ).animate(firstRotationInterval).value,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: 7 * math.pi / 6,
                        endAngle: Tween<double>(
                          begin: 2 * math.pi / 3 - _kGapAngle,
                          end: _kMinAngle,
                        ).animate(firstArchInterval).value,
                      ),
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: math.pi / 2,
                        endAngle: Tween<double>(
                          begin: 2 * math.pi / 3 - _kGapAngle,
                          end: _kMinAngle,
                        ).animate(firstArchInterval).value,
                      ),
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: -math.pi / 6,
                        endAngle: Tween<double>(
                          begin: 2 * math.pi / 3 - _kGapAngle,
                          end: _kMinAngle,
                        ).animate(firstArchInterval).value,
                      ),
                    ],
                  ),
                )
              : Transform.rotate(
                  angle: Tween<double>(
                    begin: 4 * math.pi / 3,
                    end: (4 * math.pi / 3) + (2 * math.pi / 3),
                  ).animate(secondRotationInterval).value,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: 7 * math.pi / 6,
                        endAngle: Tween<double>(
                          begin: _kMinAngle,
                          end: 2 * math.pi / 3 - _kGapAngle,
                        ).animate(secondArchInterval).value,
                      ),
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: math.pi / 2,
                        endAngle: Tween<double>(
                          begin: _kMinAngle,
                          end: 2 * math.pi / 3 - _kGapAngle,
                        ).animate(secondArchInterval).value,
                      ),
                      Arc.draw(
                        color: color,
                        size: size,
                        strokeWidth: ringWidth,
                        startAngle: -math.pi / 6,
                        endAngle: Tween<double>(
                          begin: _kMinAngle,
                          end: 2 * math.pi / 3 - _kGapAngle,
                        ).animate(secondArchInterval).value,
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
