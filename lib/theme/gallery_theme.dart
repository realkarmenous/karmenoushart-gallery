import 'package:flutter/material.dart';

// Warm, minimal "fine art gallery" palette — off-white walls, charcoal text,
// a single deep accent color. Deliberately not tech-startup purple, since
// this needs to feel like a gallery wall, not an app.
class GalleryColors {
  static const background = Color(0xFFF7F4EF); // warm off-white
  static const surface = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF1C1A17); // near-black charcoal
  static const textSecondary = Color(0xFF6B6459); // warm grey
  static const accent = Color(0xFF7A3B2E); // deep gallery red/terracotta
  static const divider = Color(0xFFE0DAD0);
}

ThemeData buildGalleryTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: GalleryColors.background,
    colorScheme: ColorScheme.light(
      primary: GalleryColors.accent,
      surface: GalleryColors.surface,
      onSurface: GalleryColors.textPrimary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: GalleryColors.background,
      foregroundColor: GalleryColors.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),
    dividerColor: GalleryColors.divider,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: GalleryColors.textPrimary,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      titleLarge: TextStyle(
        color: GalleryColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: GalleryColors.textSecondary,
        height: 1.5,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: GalleryColors.accent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
