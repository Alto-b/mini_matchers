import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_matchers/media.dart';
import 'package:mini_matchers/view/homepage.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    proceedToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lottie Animation
          Positioned.fill(
            child: Hero(
              tag: 'dots',
              child: Lottie.asset(
                Media.homePagePurpleDots,
                fit: BoxFit.cover, // Ensures the animation fills the container
              ),
            ),
          ),

          // Optional Gradient Overlay (if you want Lottie to be subtle)
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.1), // Adjust opacity as needed
            ),
          ),
          Center(
            child: Hero(tag: "icon", child: Image.asset(Media.appIconNoBg)),
          ),
        ],
      ),
    );
  }
}

Future<void> proceedToHome() async {
  await Future.delayed(Duration(seconds: 2)).then((value) {
    Get.offAll(() => HomePage(),
        duration: Duration(
          seconds: 2,
        ));
  });
}
