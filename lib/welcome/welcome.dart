import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Agne',
                  color: Color(0XFF377D71),
                ),
                child: AnimatedTextKit(
                  repeatForever: false,
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText('ExpenN',
                        speed: Duration(milliseconds: 400)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
