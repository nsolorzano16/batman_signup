import 'package:batman_signup/widgets/batman_city.dart';
import 'package:batman_signup/widgets/screen_buttons.dart';
import 'package:batman_signup/widgets/screen_signup.dart';
import 'package:batman_signup/widgets/screen_title.dart';
import 'package:flutter/material.dart';

const _batmanVerticalMovement = 60.0;

class BatmanSignUp extends StatefulWidget {
  @override
  _BatmanSignUpState createState() => _BatmanSignUpState();
}

class _BatmanSignUpState extends State<BatmanSignUp>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationLogoIn;
  Animation<double> _animationLogoMovementUp;
  Animation<double> _animationBatmanIn;
  Animation<double> _animationButtonsIn;
  Animation<double> _animationBatmanUp;

  AnimationController _animationControllerSignUp;
  Animation<double> _animationLogoOut;
  Animation<double> _animationBatmanCity;
  Animation<double> _animationSignUpIn;

  @override
  void initState() {
    _firtsAnimations();
    _secondAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _animationController,
        _animationControllerSignUp,
      ]),
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          backgroundColor: Color(0xFF100F0B),
          body: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Image.asset(
                  'assets/batman_background.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Transform.translate(
                  offset: Offset(
                    0.0,
                    _batmanVerticalMovement * _animationLogoOut.value +
                        -_animationBatmanUp.value * _batmanVerticalMovement,
                  ),
                  child: Transform.scale(
                    scale: _animationBatmanIn.value,
                    child: Image.asset(
                      'assets/batman_alone.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3.8,
                left: 40,
                right: 40,
                child: BatmanCity(
                  animation: _animationBatmanCity,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 1.8,
                left: 0,
                right: 0,
                bottom: 0,
                child: BatmanScreenSignUp(animation: _animationSignUpIn),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(
                          0.0,
                          60 * _animationLogoOut.value,
                        ),
                        child: Opacity(
                          opacity: (1 - _animationLogoOut.value),
                          child: TitleScreen(
                            animation: _animationLogoMovementUp,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Transform.translate(
                        offset: Offset(
                          0.0,
                          60 * _animationLogoOut.value,
                        ),
                        child: Opacity(
                          opacity: (1 - _animationLogoOut.value),
                          child: BatmanButtons(
                            animation: _animationButtonsIn,
                            onTap: _onSignUp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 2.2 -
                    (65 * _animationLogoMovementUp.value),
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: (1 - _animationLogoOut.value),
                  child: Transform.scale(
                    scale: _animationLogoIn.value,
                    child: Image.asset(
                      'assets/batman_logo.png',
                      fit: BoxFit.contain,
                      height: 50,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _firtsAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animationLogoIn = Tween(
      begin: 30.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.25),
      ),
    );
    _animationLogoMovementUp = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.35, 0.60),
    );
    _animationBatmanIn = Tween(
      begin: 5.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.7,
          1,
          curve: Curves.decelerate,
        ),
      ),
    );

    _animationButtonsIn = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.7,
        1.0,
      ),
    );

    _animationController.forward();
  }

  void _secondAnimations() {
    _animationControllerSignUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _animationLogoOut = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.0, 0.20),
    );

    _animationBatmanUp = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.35, 0.55),
    );

    _animationBatmanCity = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(0.65, 0.8),
    );

    _animationSignUpIn = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: Interval(
        0.85,
        1.0,
        curve: Curves.easeIn,
      ),
    );
  }

  void _onSignUp() {
    _animationControllerSignUp.forward(from: 0.0);
  }
}
