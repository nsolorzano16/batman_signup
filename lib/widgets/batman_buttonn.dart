import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

const _imageColor = Color(0xFFC8B853);

class BatmanButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool left;

  const BatmanButton({Key key, this.onTap, this.text, this.left = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.yellow,
      child: InkWell(
        onTap: onTap,
        child: ClipRect(
          child: Container(
            height: 55,
            child: Stack(
              children: [
                if (left)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-10.0)
                        ..rotateZ(
                          vector.radians(35),
                        ),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        fit: BoxFit.contain,
                        height: 40,
                        color: _imageColor,
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!left)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(10.0)
                        ..rotateZ(
                          vector.radians(-35),
                        ),
                      child: Image.asset(
                        'assets/batman_logo.png',
                        fit: BoxFit.contain,
                        height: 40,
                        color: _imageColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
