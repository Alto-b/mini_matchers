import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.lightBlueAccent, Colors.purpleAccent],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        child: Column(
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
                  return _buildOptionCard(index, colors[index % colors.length],
                      screenWidth, screenHeight);
                },
              ),
            ),

            // Bottom Padding
            const Gap(20),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard(
      int index, Color color, double screenWidth, double screenHeight) {
    final icons = [Icons.star, Icons.lightbulb, Icons.games, Icons.school];
    final titles = ['Shapes', 'Colors', 'Patterns', 'Logic'];

    return InkWell(
      onTap: () {
        print('Tapped on ${titles[index]}'); // Placeholder for action
      },
      child: Stack(
        clipBehavior:
            Clip.none, // Allows the icon to "pop" outside of the container
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
              padding: const EdgeInsets.only(top: 50.0), // Space for the icon
              child: Center(
                child: Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily:
                        'Poppins', // Ensure you have Poppins or a playful font
                  ),
                ),
              ),
            ),
          ),

          // Floating Icon
          Positioned(
            top: -30, // This moves the icon above the card
            left: (index % 2 == 0) ? 10 : 0, // Center the icon
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
    );
  }
}
