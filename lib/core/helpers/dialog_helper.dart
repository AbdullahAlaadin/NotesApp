import 'package:flutter/material.dart';

class DialogHelper {
  static Future<void> showCustomDialog({
    required BuildContext context,
    void Function()? onDismiss,
    required Widget alertDialog,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alertDialog;
      },
    ).then(
          (value) => onDismiss,
    );
  }
}
