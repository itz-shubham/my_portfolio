import 'package:url_launcher/url_launcher_string.dart';
import 'package:web/web.dart' as web;

import 'package:flutter/material.dart';

import '../models/project.dart';
import '../utils/get_screen_type.dart';

class MyFeatureProjects extends StatefulWidget {
  const MyFeatureProjects({super.key, required this.screenType});
  final ScreenType screenType;

  @override
  State<MyFeatureProjects> createState() => _MyFeatureProjectsState();
}

class _MyFeatureProjectsState extends State<MyFeatureProjects> {
  List<Project> featureProjects = Project.getProjectsList();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final boxWidth =
        widget.screenType == ScreenType.mobile ? deviceSize.width - 64 : 360.0;
    return SizedBox(
      width: deviceSize.width,
      height: boxWidth, // multiply by `x` if grid's crossAxisCount is `x`
      child: GridView.builder(
        itemCount: featureProjects.length,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 32,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => launchUrlString(featureProjects[index].link),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: HtmlElementView.fromTagName(
                      tagName: 'img',
                      onElementCreated: (element) {
                        element as web.HTMLImageElement;
                        element.src = featureProjects[index].imageUrl;
                        element.style.height = '100%';
                        element.style.width = '100%';
                      },
                    ),
                  ),
                  const Spacer(),
                  Text(
                    featureProjects[index].name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    featureProjects[index].description,
                    style: const TextStyle(color: Colors.white60),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
