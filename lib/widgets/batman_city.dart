import 'package:flutter/material.dart';

class BatmanCity extends AnimatedWidget {
  BatmanCity({Animation animation}) : super(listenable: animation);

  Animation get _animationCity => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BatmanClipper(_animationCity.value),
      child: Image.asset(
        'assets/city.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

class BatmanClipper extends CustomClipper<Path> {
  final double progress;

  BatmanClipper(this.progress);
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height * (1 - progress));
    path.lineTo(0.0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
