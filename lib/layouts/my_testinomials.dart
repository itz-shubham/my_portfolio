import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/testinomial.dart';
import '../src/colors.dart';

class MyTestinomials extends StatelessWidget {
  const MyTestinomials({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Testinomial> testinomials = Testinomial.getTestinomials();
    return CarouselSlider.builder(
      itemCount: testinomials.length,
      options: CarouselOptions(
        height: 300,
      ),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              constraints: const BoxConstraints(maxWidth: 700),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: ColoredBox(
                          color: AppColors.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Text(
                              testinomials[itemIndex].personTitle,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\"",
                          children: [
                            TextSpan(
                              text: testinomials[itemIndex].text,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const TextSpan(text: "\""),
                          ],
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "- ${testinomials[itemIndex].personName}",
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontFamily: "Diphylleia",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
