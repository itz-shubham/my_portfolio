import '../data/projects.dart';

class Project {
  final String name, description, imageUrl, link;

  Project({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.link,
  });

  static List<Project> getProjectsList() {
    return projectsData
        .map((data) => Project(
            name: data['name'],
            description: data['description'],
            imageUrl: data['imageUrl'],
            link: data['link']))
        .toList();
  }
}
