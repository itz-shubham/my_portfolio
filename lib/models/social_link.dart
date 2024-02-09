import '../data/social_links.dart';

class SocialLink {
  final String name, iconAssetPath, link;

  SocialLink({
    required this.name,
    required this.iconAssetPath,
    required this.link,
  });

  static List<SocialLink> getSocialLinks() {
    return socialLinksData
        .map((socialLink) => SocialLink(
              name: socialLink['name']!,
              iconAssetPath: socialLink['assetImagePath']!,
              link: socialLink['link']!,
            ))
        .toList();
  }
}
