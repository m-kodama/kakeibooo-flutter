import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakeibooo_flutter/core/app_color.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData _getBase(Brightness brightness) => ThemeData(
        brightness: brightness,
        colorSchemeSeed: AppColors.primary,
        useMaterial3: true,
        textTheme: GoogleFonts.mPlusRounded1cTextTheme(
          brightness == Brightness.light
              ? ThemeData.light().textTheme
              : ThemeData.dark().textTheme,
        ).copyWith().apply(
              displayColor: AppColors.black,
              bodyColor: AppColors.black,
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static final ThemeData light = _getBase(Brightness.light).copyWith();

  static final ThemeData dark = _getBase(Brightness.dark).copyWith(
    applyElevationOverlayColor: true,
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardColor: const Color(0xFF121212),
    // colorScheme: const ColorScheme.dark(),
  );
}
