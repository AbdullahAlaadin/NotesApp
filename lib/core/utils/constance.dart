import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConstance {
  // date & time & currency format
  static DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  // static DateFormat timeFormat = DateFormat('hh:mm a');
  // static NumberFormat currencyFormat = NumberFormat("#,##0.0", "en_US");

  static bool isDark(context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }

  static const String notesBox = 'notes_box';
}
