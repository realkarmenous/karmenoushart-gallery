import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:url_launcher/url_launcher.dart";
import "../theme/gallery_theme.dart";

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});

  static final List<_SocialLink> _links = [
    _SocialLink(FontAwesomeIcons.instagram, "https://instagram.com/karmenoushart"),
    _SocialLink(FontAwesomeIcons.tiktok, "https://tiktok.com/@karmenoushart"),
    _SocialLink(FontAwesomeIcons.youtube, "https://youtube.com/@yourusername"),
    _SocialLink(FontAwesomeIcons.xTwitter, "https://x.com/yourusername"),
    _SocialLink(FontAwesomeIcons.linkedin, "https://linkedin.com/in/yourusername"),
    _SocialLink(FontAwesomeIcons.snapchat, "https://snapchat.com/add/yourusername"),
    _SocialLink(FontAwesomeIcons.whatsapp, "https://wa.me/2349164200997"),
  ];

  Future<void> _open(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _links.map((link) {
        return IconButton(
          icon: FaIcon(link.icon, size: 16, color: GalleryColors.textPrimary),
          onPressed: () => _open(link.url),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          constraints: const BoxConstraints(),
          splashRadius: 18,
          tooltip: "",
        );
      }).toList(),
    );
  }
}

class _SocialLink {
  final IconData icon;
  final String url;
  const _SocialLink(this.icon, this.url);
}
