import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'logincard.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

@override
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
            curve: Curves.easeInOutSine,
            centered: true,
            duration: 1800,
            splash: Image.asset('assets/images/cee.png'),
            splashIconSize: 180.0,
            //pageTransitionType: PageTransitionType.leftToRightWithFade,
            nextScreen: const loginCard(),
            animationDuration: const Duration(seconds: 3),
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.white)

        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Center(
        //       child: Container(child: Image.asset('assets/images/cee.png')),
        //     ),
        //   ],
        // ),
        );
  }
}
