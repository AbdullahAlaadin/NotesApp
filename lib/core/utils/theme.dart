import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

//Thine 100
//extra light 200
//light 300
//regular 400
//Medium 500
//Semi bold 600
//bold 700
//extra bold 800

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.lightWhiteColor,
    ),
    backgroundColor: AppColors.lightWhiteColor,
    centerTitle: true,
    elevation: 0.0,
    toolbarHeight: 80,
    titleTextStyle: TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 24.0,
      // fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsets.zero,
    iconColor: Colors.black,
    titleTextStyle: const TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitleTextStyle: TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black.withOpacity(0.6),
      height: 1.3,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 2.0,
    splashColor: Colors.transparent,
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    hoverColor: Colors.transparent,
  ),
  primaryColor: AppColors.lightWhiteColor,
  scaffoldBackgroundColor: AppColors.lightWhiteColor,
  fontFamily: 'Vazirmatn-Bold',
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: AppColors.blackColor.withOpacity(0.5),
    cursorColor: AppColors.blackColor.withOpacity(0.6),
    selectionHandleColor: AppColors.blackColor.withOpacity(1),
  ),
  textTheme: TextTheme(
    /// Content
    bodyLarge: const TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(0.5),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.grey.shade800,
    ),
    backgroundColor: Colors.grey.shade800,
    centerTitle: true,
    elevation: 0.0,
    toolbarHeight: 80,
    titleTextStyle: const TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 24.0,
      color: AppColors.whiteColor,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.whiteColor,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.whiteColor,
    ),
  ),
  listTileTheme: ListTileThemeData(
    contentPadding: EdgeInsets.zero,
    iconColor: Colors.black,
    titleTextStyle: const TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitleTextStyle: TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: Colors.black.withOpacity(0.8),
      height: 1.3,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 2.0,
    splashColor: Colors.transparent,
    foregroundColor: Colors.white,
    backgroundColor: Colors.black,
    hoverColor: Colors.transparent,
  ),
  primaryColor: AppColors.whiteColor,
  scaffoldBackgroundColor: Colors.grey.shade800,
  fontFamily: 'Vazirmatn-Bold',
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: AppColors.whiteColor.withOpacity(0.5),
    cursorColor: AppColors.whiteColor.withOpacity(0.6),
    selectionHandleColor: AppColors.whiteColor.withOpacity(1),
  ),
  textTheme: TextTheme(
    /// Content
    bodyLarge: const TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: const TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Vazirmatn-Bold',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(0.5),
    ),
  ),
);
