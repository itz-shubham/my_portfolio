import 'package:flutter/material.dart';

import 'layouts/my_appbar.dart';
import 'layouts/my_cover.dart';
import 'layouts/my_feature_projects.dart';
import 'layouts/my_footer.dart';
import 'layouts/my_testinomials.dart';
import 'src/colors.dart';
import 'utils/get_screen_type.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final screenType = getScreenType(constraints);
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: MyAppBar(screenType: screenType),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyCover(screenType: screenType),
              const SizedBox(height: 100),
              titleLabel("Feature Projects"),
              titleUnderLine(128),
              const SizedBox(height: 64),
              MyFeatureProjects(screenType: screenType),
              const SizedBox(height: 100),
              titleLabel("Testimonials"),
              titleUnderLine(100),
              const MyTestinomials(),
              MyFooter(screenType: screenType),
              const ColoredBox(
                color: Colors.black,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Made by Myself using Flutter with "),
                        Icon(Icons.favorite, color: Colors.red, size: 20)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Text titleLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget titleUnderLine(double width) {
    return SizedBox(
      width: width,
      child: const Divider(height: 8, thickness: 2),
    );
  }
}
