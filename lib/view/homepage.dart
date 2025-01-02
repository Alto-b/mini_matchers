import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_matchers/media.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            // Lottie Animation
            Positioned.fill(
              child: Hero(
                tag: 'dots',
                child: Lottie.asset(
                  Media.homePagePurpleDots,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Optional Gradient Overlay
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            Column(
              children: [
                // App Logo with Hero Animation
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                  child: Hero(
                    tag: "icon",
                    child: Image.asset(
                      Media.appIconNoBg,
                      height: screenHeight * 0.40,
                    ),
                  ),
                ),

                // Options Body
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final colors = [
                        Colors.red,
                        Colors.orange,
                        Colors.blue,
                        Colors.green
                      ];
                      return _buildOptionCard(
                          index,
                          colors[index % colors.length],
                          screenWidth,
                          screenHeight);
                    },
                  ),
                ),

                // Bottom Padding
                const Gap(20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
      int index, Color color, double screenWidth, double screenHeight) {
    final icons = [Icons.star, Icons.lightbulb, Icons.games, Icons.school];
    final titles = ['Shapes', 'Colors', 'Patterns', 'Logic'];

    return GestureDetector(
      onTap: () {
        showTapToPlaySnackbar(
            context, titles[index], color, icons[index], index);
      },
      child: Hero(
        tag: 'option-$index', // Unique Hero tag for each option
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Main Card Background
            Container(
              height: screenHeight * 0.2,
              width: screenWidth * 0.4,
              decoration: BoxDecoration(
                color: color.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    titles[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),

            // Floating Icon
            Positioned(
              top: -30,
              left: (index % 2 == 0) ? 10 : 0,
              right: (index % 2 == 1) ? 10 : 0,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    icons[index],
                    size: 30,
                    color: color.withOpacity(0.9),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showTapToPlaySnackbar(BuildContext context, String title, Color color,
      IconData icon, int index) {
    // Check if a snackbar is already open
    if (!Get.isSnackbarOpen) {
      Get.snackbar(
        '',
        '',
        titleText: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        messageText: Padding(
          padding: const EdgeInsets.all(0.0),
          child: const Text(
            'Tap to play',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(12.0),
        borderRadius: 20.0,
        backgroundGradient: LinearGradient(
          colors: [color.withOpacity(0.8), color.withOpacity(0.9)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            // blurRadius: 2,
            // offset: const Offset(0, 5),
          ),
        ],
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: 28,
              color: color,
            ),
          ),
        ),
        mainButton: TextButton(
          onPressed: () {
            Get.closeCurrentSnackbar();
          },
          child: const Text(
            'DISMISS',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        onTap: (snack) {
          print("$title pressed");
        },
        overlayBlur: 2.0, // Add subtle blur effect in the background
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: Colors.white.withOpacity(0.6),
        progressIndicatorValueColor: AlwaysStoppedAnimation<Color>(color),
      );
    }
  }
}
