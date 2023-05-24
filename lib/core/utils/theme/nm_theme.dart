import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nextminute/core/utils/theme/nm_colors.dart';

class NextMinuteTheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      useMaterial3: true,
      // primaryColor: NMColors.orange,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: NMColors.orange,
        centerTitle: true,
        scrolledUnderElevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        titleTextStyle: GoogleFonts.openSans(
          fontSize: 18,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: NMColors.orange,
      ),
      dialogTheme: DialogTheme(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        actionsPadding: const EdgeInsets.all(12),
        titleTextStyle: GoogleFonts.openSans(
          color: NMColors.black,
          fontSize: 18,
        ),
        contentTextStyle: GoogleFonts.openSans(
          color: NMColors.black,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(NMColors.orange),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      textTheme: GoogleFonts.openSansTextTheme()
          .copyWith(
            bodyMedium: GoogleFonts.openSans(
              fontSize: 16,
            ),
          )
          .apply(
            bodyColor: NMColors.black,
            displayColor: NMColors.black,
          ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: NMColors.orange,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        isDense: true,
        fillColor: Colors.grey.shade100,
        filled: true,
        hintStyle: TextStyle(
          color: Colors.grey.shade500,
        ),
        floatingLabelStyle: const TextStyle(
          color: NMColors.orange,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: NMColors.orange),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusColor: Colors.red,
        iconColor: NMColors.black,
      ),
      chipTheme: ChipThemeData(
        labelStyle: GoogleFonts.openSans(
          color: Colors.grey.shade900,
          fontSize: 14,
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: NMColors.black,
        collapsedIconColor: NMColors.black,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: NMColors.orange,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: NMColors.orange,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      cardTheme: const CardTheme(
        color: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey.shade200,
      ),
      iconTheme: IconThemeData(
        color: Colors.grey.shade900,
        size: 27,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NMColors.orange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: Colors.blue,
        primaryContrastingColor: NMColors.orange,
        textTheme: CupertinoTextThemeData(
          actionTextStyle: GoogleFonts.openSans(
            color: Colors.black,
          ),
          primaryColor: Colors.black,
          textStyle: GoogleFonts.openSans(
            color: Colors.black,
          ),
        ),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: NMColors.orange,
        secondary: NMColors.orange,
        outline: Colors.transparent,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(NMColors.orange),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color.fromARGB(255, 17, 17, 27),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: NMColors.orange,
        centerTitle: true,
        titleTextStyle: GoogleFonts.openSans(
          fontSize: 18,
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: NMColors.orange,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(NMColors.orange),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      textTheme: GoogleFonts.openSansTextTheme()
          .copyWith(
            bodyMedium: GoogleFonts.openSans(
              fontSize: 16,
            ),
          )
          .apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: NMColors.orange,
        backgroundColor: Colors.black,
        enableFeedback: true,
        selectedLabelStyle: GoogleFonts.openSans(
          fontSize: 12,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        isDense: true,
        fillColor: NMColors.black,
        filled: true,
        hintStyle: GoogleFonts.openSans(
          color: Colors.grey.shade500,
        ),
        floatingLabelStyle: GoogleFonts.openSans(
          color: NMColors.orange,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: NMColors.orange),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusColor: Colors.red,
        iconColor: NMColors.black,
      ),
      chipTheme: ChipThemeData(
        labelStyle: GoogleFonts.openSans(
          color: Colors.grey.shade900,
          fontSize: 14,
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        iconColor: NMColors.black,
        collapsedIconColor: NMColors.black,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: NMColors.orange,
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Colors.white,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 27,
      ),
      cardTheme: const CardTheme(
        color: NMColors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: NMColors.orange,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: Colors.white,
        primaryContrastingColor: NMColors.orange,
        textTheme: CupertinoTextThemeData(
          actionTextStyle: GoogleFonts.openSans(
            color: Colors.red,
          ),
          primaryColor: Colors.red,
          textStyle: GoogleFonts.openSans(
            color: Colors.red,
          ),
        ),
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Colors.white,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey.shade600,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(NMColors.orange),
      ),
    );
  }
}
