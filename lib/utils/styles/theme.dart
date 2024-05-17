import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news_app/utils/constants/constants.dart';

abstract class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    required Color buttonText,
    Color? cardBackground,
    Color? disabled,
    required Color error,
  }) {
    final baseTextTheme = brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    return ThemeData(
      useMaterial3: false,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      brightness: brightness,
      scaffoldBackgroundColor: background,
      canvasColor: background,
      cardColor: background,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
      primaryColor: accentColor,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: accentColor,
        selectionHandleColor: accentColor,
        cursorColor: accentColor,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: secondaryText,
          size: 26.w,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColors.baseColor,
        size: Dimensions.iconSize16,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: accentColor,
          primaryContainer: accentColor,
          secondary: accentColor,
          secondaryContainer: accentColor,
          surface: background,
          background: background,
          error: error,
          onPrimary: buttonText,
          onSecondary: buttonText,
          onSurface: buttonText,
          onBackground: buttonText,
          onError: buttonText,
        ),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: accentColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(color: error),
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: Dimensions.fontSize16,
          color: primaryText.withOpacity(0.5),
        ),
        hintStyle: TextStyle(
          color: secondaryText,
          fontSize: Dimensions.fontSize13,
          fontWeight: FontWeight.w300,
        ),
      ),
      unselectedWidgetColor: AppColors.lightGray,
      fontFamily: AppFonts.mulishRegular,
      textTheme: TextTheme(
        headlineLarge: baseTextTheme.displayLarge!.copyWith(
          fontFamily: AppFonts.mulishRegular,
          color: primaryText,
          fontSize: Dimensions.fontSize20,
        ),
        headlineMedium: baseTextTheme.displayMedium!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize16,
        ),
        headlineSmall: baseTextTheme.displaySmall!.copyWith(
          color: secondaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize12,
        ),
        titleLarge: baseTextTheme.displayLarge!.copyWith(
          fontFamily: AppFonts.mulishRegular,
          color: primaryText,
          fontSize: Dimensions.fontSize20,
        ),
        titleMedium: baseTextTheme.displayMedium!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize16,
        ),
        titleSmall: baseTextTheme.displaySmall!.copyWith(
          color: secondaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize12,
        ),
        labelLarge: baseTextTheme.displayLarge!.copyWith(
          fontFamily: AppFonts.mulishRegular,
          color: primaryText,
          fontSize: Dimensions.fontSize20,
        ),
        labelMedium: baseTextTheme.displayMedium!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize16,
        ),
        labelSmall: baseTextTheme.displaySmall!.copyWith(
          color: secondaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize12,
        ),
        displayLarge: baseTextTheme.displayLarge!.copyWith(
          fontFamily: AppFonts.mulishRegular,
          color: primaryText,
          fontSize: Dimensions.fontSize20,
        ),
        displayMedium: baseTextTheme.displayMedium!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize16,
        ),
        displaySmall: baseTextTheme.displaySmall!.copyWith(
          color: secondaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize12,
        ),
        bodyLarge: baseTextTheme.displayLarge!.copyWith(
          fontFamily: AppFonts.mulishRegular,
          color: primaryText,
          fontSize: Dimensions.fontSize20,
        ),
        bodyMedium: baseTextTheme.displayMedium!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize16,
        ),
        bodySmall: baseTextTheme.displaySmall!.copyWith(
          color: secondaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize12,
        ),
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
    brightness: Brightness.light,
    background: AppColors.lightScaffoldBackgroundColor,
    cardBackground: AppColors.secondaryAppColor,
    primaryText: Colors.black,
    secondaryText: Colors.white,
    accentColor: AppColors.secondaryAppColor,
    divider: AppColors.secondaryAppColor,
    buttonBackground: Colors.black38,
    buttonText: AppColors.secondaryAppColor,
    disabled: AppColors.secondaryAppColor,
    error: Colors.red,
  );

  static ThemeData get darkTheme => createTheme(
    brightness: Brightness.dark,
    background: AppColors.darkScaffoldBackgroundColor,
    cardBackground: AppColors.secondaryDarkAppColor,
    primaryText: Colors.white,
    secondaryText: Colors.black,
    accentColor: AppColors.secondaryDarkAppColor,
    divider: Colors.black45,
    buttonBackground: Colors.white,
    buttonText: AppColors.secondaryDarkAppColor,
    disabled: AppColors.secondaryDarkAppColor,
    error: Colors.red,
  );
}