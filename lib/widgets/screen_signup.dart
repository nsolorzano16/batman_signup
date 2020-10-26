import 'package:flutter/material.dart';

import 'package:batman_signup/widgets/batman_buttonn.dart';

class BatmanScreenSignUp extends AnimatedWidget {
  BatmanScreenSignUp({Animation animation}) : super(listenable: animation);

  Animation get _animationSignUpIn => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Opacity(
        opacity: _animationSignUpIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            100 * (1 - _animationSignUpIn.value),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'GET ACCESS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _BatmanInput(
                  label: 'FULL NAME',
                ),
                const SizedBox(height: 20),
                _BatmanInput(
                  label: 'EMAIL',
                ),
                const SizedBox(height: 20),
                _BatmanInput(
                  label: 'PASSWORD  ',
                  password: true,
                ),
                const SizedBox(height: 20),
                BatmanButton(
                  text: 'Sign Up',
                  onTap: () {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BatmanInput extends StatelessWidget {
  final String label;
  final bool password;

  const _BatmanInput({Key key, @required this.label, this.password = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: password,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            color: Colors.grey[600],
          ),
          enabledBorder: border,
          border: border,
        ),
      ),
    );
  }
}
