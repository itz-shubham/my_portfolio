import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../utils/get_screen_type.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.screenType});

  final ScreenType screenType;

  @override
  Widget build(BuildContext context) {
    final space = SizedBox(width: screenType == ScreenType.desktop ? 32 : 16);
    return AppBar(
      flexibleSpace: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            space,
            const Text(
              "Shubham",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: "Diphylleia",
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () => launchUrlString(
                'https://firebasestorage.googleapis.com/v0/b/itz-shubham.appspot.com/o/Resume.pdf?alt=media&token=ebc88d8c-8360-4b10-b580-c5b3db42aa42',
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(128, 40),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              icon: const Text("Resume"),
              label: const Icon(Icons.open_in_new_rounded, size: 14),
            ),
            // ...buildActions(screenType),
            space,
          ],
        ),
      ),
    );
  }

  // buildActions(ScreenType screenType) {
  //   if (screenType == ScreenType.desktop) {
  //     return [
  //       const SizedBox(width: 8),
  //       TextButton(onPressed: () {}, child: const Text("Hire Me")),
  //       const SizedBox(width: 16),
  //       ElevatedButton.icon(
  //         onPressed: () {},
  //         style: ElevatedButton.styleFrom(
  //           fixedSize: const Size(128, 40),
  //           textStyle: const TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         icon: const Text("Resume"),
  //         label: const Icon(Icons.open_in_new_rounded, size: 14),
  //       ),
  //     ];
  //   } else {
  //     return [
  //       ElevatedButton(
  //         onPressed: () {},
  //         style: ElevatedButton.styleFrom(
  //           fixedSize: const Size(40, 40),
  //         ),
  //         child: const Icon(Icons.menu_open_rounded),
  //       ),
  //     ];
  //   }
  // }
}
