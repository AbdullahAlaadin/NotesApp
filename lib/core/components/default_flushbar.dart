import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showDefaultFlushBar({
  required BuildContext context,
  required Color color,
  Widget? icon,
  String? title,
  required String messageText,
}) =>
    Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.TOP,
      margin: const EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
      ),
      backgroundColor: color,
      borderRadius: BorderRadius.circular(10),
      barBlur: 5,
      icon: icon ??
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
      messageText: Text(
        messageText,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
            ),
      ),
      title: title,
      duration: const Duration(seconds: 4),
    ).show(context);
