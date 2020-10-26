import 'package:batman_signup/widgets/batman_buttonn.dart';
import 'package:flutter/material.dart';

class BatmanButtons extends AnimatedWidget {
  final VoidCallback onTap;

  BatmanButtons({@required this.onTap, Animation animation})
      : super(listenable: animation);

  Animation get _animationButtonsIn => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Opacity(
        opacity: _animationButtonsIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            100 * (1 - _animationButtonsIn.value),
          ),
          child: Column(
            children: [
              BatmanButton(
                text: 'Login',
                onTap: () {},
                left: false,
              ),
              const SizedBox(
                height: 10,
              ),
              BatmanButton(
                text: 'Sign Up',
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
