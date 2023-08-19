import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

 Shader linearGradient = const LinearGradient(
  colors: <Color>[Color(0xffff0000), Color(0xff000000)],
).createShader(const Rect.fromLTWH(-5,1.0,2000,10.0));

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Hello Gradients!',
                  style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient),
                ),
                GradientText(
                  'Gradient Text Example',
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,

                  ),
                  gradientType: GradientType.radial,
                  radius: 0.5,
                  colors: [
                    Colors.black,
                    Colors.red,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
