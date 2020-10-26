import 'package:flutter/material.dart';

class TitleScreen extends AnimatedWidget {
  TitleScreen({Animation animation}) : super(listenable: animation);
  Animation get _animationLogoMovementUp => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationLogoMovementUp.value,
      child: Column(
        children: [
          Text(
            'WELCOME TO',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          Text(
            'GOTHAM CITY',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
