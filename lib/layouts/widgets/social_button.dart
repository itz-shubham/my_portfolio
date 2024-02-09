import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.assetIconPath,
    required this.link,
  });
  final String assetIconPath, link;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrlString(link),
        child: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white,
          child: Image.asset(
            assetIconPath,
            height: 22,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
