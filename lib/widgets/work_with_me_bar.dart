import 'package:flutter/material.dart';
import '../theme/gallery_theme.dart';

// Full-width bar fixed to the bottom of the screen. Used as
// Scaffold.bottomNavigationBar, which — unlike a Positioned widget inside
// the body — is guaranteed to stay in place no matter how the content
// above it scrolls.
class WorkWithMeBar extends StatelessWidget {
  final VoidCallback onPressed;
  const WorkWithMeBar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        color: GalleryColors.surface,
        border: Border(top: BorderSide(color: GalleryColors.divider)),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: GalleryColors.accent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 4,
          ),
          child: const Text(
            'Work With Me',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ),
    );
  }
}