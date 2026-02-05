import 'package:flutter/material.dart';

/// Animation constants for consistent motion design
class AnimationConstants {
  AnimationConstants._();

  // Durations
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 450);
  static const Duration durationVerySlow = Duration(milliseconds: 600);

  // Stagger Delays
  static const Duration staggerDelayFast = Duration(milliseconds: 50);
  static const Duration staggerDelayNormal = Duration(milliseconds: 100);
  static const Duration staggerDelaySlow = Duration(milliseconds: 150);

  // Curves
  static const Curve curveDefault = Curves.easeOutCubic;
  static const Curve curveEmphasized = Curves.easeInOutCubic;
  static const Curve curveDecelerate = Curves.decelerate;
  static const Curve curveElastic = Curves.elasticOut;
  static const Curve curveBounce = Curves.bounceOut;

  // Offset values for slide animations
  static const double slideOffsetSmall = 20.0;
  static const double slideOffsetMedium = 40.0;
  static const double slideOffsetLarge = 60.0;

  // Scale values
  static const double scaleStart = 0.8;
  static const double scaleEnd = 1.0;
  static const double pulseScale = 1.05;

  // Fade values
  static const double fadeStart = 0.0;
  static const double fadeEnd = 1.0;
}
