import 'package:flutter/material.dart';

import '../src/colors.dart';
import '../utils/get_screen_type.dart';

const _coverImageUrl =
    "https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
// 'https://images.unsplash.com/photo-1628277613967-6abca504d0ac?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',

class MyCover extends StatelessWidget {
  const MyCover({super.key, required this.screenType});

  final ScreenType screenType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.black, // shows until image loaded
        image: DecorationImage(
          image: NetworkImage(_coverImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: ColoredBox(
        color: Colors.black87,
        child: Padding(
          padding: EdgeInsets.all(
            screenType == ScreenType.desktop ? 64 : 32,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Hi, I am ",
                    children: const [
                      TextSpan(
                        text: "Shubham",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenType == ScreenType.desktop ? 48 : 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Diphylleia",
                    ),
                    spellOut: true,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: "A full-stack ",
                    children: const [
                      TextSpan(
                        text: "Flutter Developer",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      TextSpan(
                        text: " who crafts ideas into real-world mobile apps",
                      ),
                    ],
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenType == ScreenType.desktop ? 18 : 16,
                    ),
                    spellOut: true,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
