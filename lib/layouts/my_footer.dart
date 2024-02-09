import 'package:flutter/material.dart';

import '../models/social_link.dart';
import '../src/colors.dart';
import '../utils/get_screen_type.dart';
import 'widgets/contact_me_form.dart';
import 'widgets/social_button.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key, required this.screenType});
  final ScreenType screenType;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: screenType == ScreenType.desktop
          ? IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(flex: 2, child: buildInfo()),
                  const VerticalDivider(
                    indent: 16,
                    endIndent: 16,
                    color: Colors.white60,
                  ),
                  Expanded(
                    flex: 1,
                    child: ContactMeForm(screenType: screenType),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                buildInfo(),
                const Divider(),
                ContactMeForm(screenType: screenType),
              ],
            ),
    );
  }

  Widget buildInfo() {
    return Padding(
      padding: EdgeInsets.all(
        screenType == ScreenType.desktop ? 48 : 32,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Shubham",
            style: TextStyle(
              fontSize: 24,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "Diphylleia",
            ),
          ),
          const Row(
            children: [
              Icon(Icons.location_pin, size: 12),
              SizedBox(width: 4),
              Text("Muzaffarpur, Bihar, India")
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: SocialLink.getSocialLinks().map((socialLink) {
              return SocialButton(
                assetIconPath: socialLink.iconAssetPath,
                link: socialLink.link,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
