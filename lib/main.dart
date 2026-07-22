import 'package:flutter/material.dart';
import 'screens/gallery_screen.dart';
import 'theme/gallery_theme.dart';

void main() {
  runApp(const ArtGalleryApp());
}

class ArtGalleryApp extends StatelessWidget {
  const ArtGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olaleye Babatunde Danel — Gallery',
      debugShowCheckedModeBanner: false,
      theme: buildGalleryTheme(),
      home: const GalleryScreen(),
    );
  }
}
