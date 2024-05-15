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
      backgroundColor: Colors.white,
      brightness: brightness,
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
        headline1: baseTextTheme.headline1!.copyWith(
          fontFamily: AppFonts.mulishRegular,
          color: primaryText,
          fontSize: Dimensions.fontSize34,
          fontWeight: FontWeight.bold,
        ),
        headline2: baseTextTheme.headline2!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize22,
          fontWeight: FontWeight.bold,
        ),
        headline3: baseTextTheme.headline3!.copyWith(
          color: secondaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize20,
          fontWeight: FontWeight.w600,
        ),
        headline4: baseTextTheme.headline4!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize18,
          fontWeight: FontWeight.w600,
        ),
        headline5: baseTextTheme.headline5!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize16,
          fontWeight: FontWeight.w700,
        ),
        headline6: baseTextTheme.headline6!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize14,
          fontWeight: FontWeight.w700,
        ),
        bodyText1: baseTextTheme.bodyText1!.copyWith(
          color: secondaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize15,
        ),
        bodyText2: baseTextTheme.bodyText2!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize12,
          fontWeight: FontWeight.w400,
        ),
        button: baseTextTheme.button!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize12,
          fontWeight: FontWeight.w700,
        ),
        caption: baseTextTheme.caption!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize11,
          fontWeight: FontWeight.w300,
        ),
        overline: baseTextTheme.overline!.copyWith(
          color: secondaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize11,
          fontWeight: FontWeight.w500,
        ),
        subtitle1: baseTextTheme.subtitle1!.copyWith(
          color: primaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize16,
          fontWeight: FontWeight.w700,
        ),
        subtitle2: baseTextTheme.subtitle2!.copyWith(
          color: secondaryText,
          fontFamily: AppFonts.mulishRegular,
          fontSize: Dimensions.fontSize11,
          fontWeight: FontWeight.w500,
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