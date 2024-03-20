import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrimony_app/utils/pref_utils.dart';
import 'package:matrimony_app/utils/size_utils.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  final _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary.withOpacity(0.1),
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: const BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 50,
        space: 50,
        color: appTheme.black900,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyMedium: TextStyle(
          color: colorScheme.onPrimaryContainer,
          fontSize: 14.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w200,
        ),
        bodySmall: TextStyle(
          color: colorScheme.secondaryContainer,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.lightBlue500,
          fontSize: 25.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        labelLarge: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: colorScheme.primary.withOpacity(0.75),
          fontSize: 10.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 20.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        titleMedium: TextStyle(
          color: appTheme.lightBlue500,
          fontSize: 18.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w800,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900.withOpacity(0.75),
          fontSize: 15.fSize,
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w700,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF10ADEF),
    primaryContainer: Color(0XFF333333),
    secondary: Color(0XFF333333),
    secondaryContainer: Color(0XFFB8B8B8),
    tertiary: Color(0XFF333333),
    tertiaryContainer: Color(0XFFB8B8B8),

    // Background colors
    background: Color(0XFF333333),

    // Surface colors
    surface: Color(0XFF333333),
    surfaceTint: Color(0XFF333333),
    surfaceVariant: Color(0XFFB8B8B8),

    // Error colors
    error: Color(0XFF333333),
    errorContainer: Color(0XFFB8B8B8),
    onError: Color(0XFF010101),
    onErrorContainer: Color(0XFF333333),

    // On colors(text colors)
    onBackground: Color(0XFF010101),
    onInverseSurface: Color(0XFF010101),
    onPrimary: Color(0XFF333333),
    onPrimaryContainer: Color(0XFF010101),
    onSecondary: Color(0XFF010101),
    onSecondaryContainer: Color(0XFF333333),
    onTertiary: Color(0XFF010101),
    onTertiaryContainer: Color(0XFF333333),

    // Other colors
    outline: Color(0XFF333333),
    outlineVariant: Color(0XFF333333),
    scrim: Color(0XFF333333),
    shadow: Color(0XFF333333),

    // Inverse colors
    inversePrimary: Color(0XFF333333),
    inverseSurface: Color(0XFF333333),

    // Pending colors
    onSurface: Color(0XFF010101),
    onSurfaceVariant: Color(0XFF333333),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber700 => const Color(0xFFfd7e14);
  Color get amber800 => const Color(0xFFFF9F43);

  Color get blogBoxColor => const Color(0xFFff8d3c);

  Color get headerColor => const Color(0xFF2E3551);
  Color get profileView => const Color(0xFFf6af04);
  Color get onlineAvail => const Color(0xFF5BBC71);

  Color get heading => const Color(0xFF66451c);

  // Black
  Color get black900 => const Color(0XFF000000);
  Color get black908 => const Color(0XFF70798c);

  // Blue
  Color get blue600 => const Color(0XFF0873e1);
  Color get blue1600 => const Color(0XFF2794CF);
  Color get credit => const Color(0XFFDB214C);

  Color get birthDayCard => const Color(0XFF1D9BF0);

  // BlueGray
  Color get blueGray400 => const Color(0XFF888888);
  Color get blueGray900 => const Color(0XFF353636);

  // Gray
  Color get gray => const Color(0XFF808080);
  Color get hobbies => const Color(0XFFEFEFEF);
  Color get profileData => const Color(0XFF718FA0);
  Color get gray200 => const Color(0XFFF2F0EC);
  Color get gray400 => const Color(0XFFC5C4C4);
  Color get gray50 => const Color(0XFFF8FDFF);
  Color get gray500 => const Color(0XFF979797);
  Color get profileColor => const Color(0XFFDBDADE);
  Color get filterColor => const Color(0XFFBDBDBD);

  // Orange
  Color get orange => const Color(0xFFfd7e14);
  Color get orange1 => const Color(0XFFFF9F00);
  Color get actionButton => const Color(0XFFFd7e14);
  Color get firstSite => const Color(0XFFffb400);
  Color get trustedColor => const Color(0XFFCC9966);
  Color get planCancel => const Color(0XFFFFF3CD);
  Color get siteName => const Color(0XFFff9f1c);

  // Green
  Color get green600 => const Color(0XFF28C76F);
  Color get newGreen => const Color(0XFF38a3a5);
  Color get redColor => const Color(0XFFe56b6f);
  Color get tealColor => const Color(0XFF008080);

  Color get activeBackgroundColor => const Color.fromARGB(40, 20, 20, 20);

  //grey
  Color get subHeadingColor => const Color(0XFF2f2b3d);

  // LightBlue
  Color get lightBlue500 => const Color(0XFF0FACEF);

  // RedD
  Color get red600D8 => const Color.fromARGB(215, 202, 5, 25);
  Color get pink => const Color.fromARGB(255, 255, 94, 255);
  Color get newPink => const Color(0XFFef476f);
  Color get bellIconNotification => const Color(0XFFEA5455);

  // White
  Color get whiteA700 => const Color(0XFFFFFFFF);
  Color get backgroundColor => Color.fromARGB(255, 105, 43, 230);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
