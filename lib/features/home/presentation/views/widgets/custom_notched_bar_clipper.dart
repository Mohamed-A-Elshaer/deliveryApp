import 'package:flutter/cupertino.dart';

/// Clipper that creates a pill shape with a centered circular notch.
class CustomNotchedBarClipper extends CustomClipper<Path> {
  CustomNotchedBarClipper({
    required this.cornerRadius,
    required this.notchRadius,
    required this.width,
    required this.height,
  });

  final double cornerRadius;
  final double notchRadius;
  final double width;
  final double height;

  @override
  Path getClip(Size size) {
    final double w = width;
    final double h = height;
    final Path base = Path()
      ..addRRect(RRect.fromLTRBR(0, 0, w, h, Radius.circular(cornerRadius)));

    final Path notch = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(w / 2, h / 2),
        radius: notchRadius,
      ));

    return Path.combine(PathOperation.difference, base, notch);
  }

  @override
  bool shouldReclip(covariant CustomNotchedBarClipper oldClipper) {
    return cornerRadius != oldClipper.cornerRadius ||
        notchRadius != oldClipper.notchRadius ||
        width != oldClipper.width ||
        height != oldClipper.height;
  }
}
