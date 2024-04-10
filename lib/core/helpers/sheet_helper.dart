import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_notes/core/extensions/context_ex.dart';
import 'package:my_notes/core/utils/constance.dart';

import '../utils/colors.dart';

class SheetHelper {
  static Future showCustomSheet({
    required BuildContext context,
    required String title,
    Color? titleColor,
    double? bottomSheetHeight,
    required Widget bottomSheetContent,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppConstance.isDark(context) ? Colors.grey.shade800 : AppColors.lightWhiteColor,
      constraints: BoxConstraints.loose(
        Size(
          context.screenWidth,
          bottomSheetHeight ?? context.screenHeight * 0.7,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            20.0,
          ),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 16.0, left: 16.0, right: 16.0, bottom: MediaQuery.of(context).viewInsets.bottom + 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 21.0,
                          fontWeight: FontWeight.w600,
                          color: titleColor,
                        ),
                  ),
                  // Container(
                  //   // backgroundColor: Colors.white,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: AppConstance.isDark(context) ? Colors.grey.shade700 : Colors.white,
                  //     // border: Border.all(
                  //     //   color: AppConstance.isDark(context) ? Colors.black54 : Colors.grey.withOpacity(0.2),
                  //     //   width: 1,
                  //     // ),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color:
                  //             AppConstance.isDark(context) ? Colors.grey.shade700 : Colors.grey.withOpacity(0.2),
                  //         blurRadius: 5.0, // soften the shadow
                  //         spreadRadius: 0.0, //extend the shadow
                  //         offset: const Offset(
                  //           2.0, // Move to right 10  horizontally
                  //           2.0, // Move to bottom 10 Vertically
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  //   child: IconButton(
                  //     highlightColor: Colors.transparent,
                  //     onPressed: () => context.pop(),
                  //     color: AppConstance.isDark(context) ? Colors.white : Colors.black,
                  //     icon: const Icon(
                  //       Icons.close,
                  //       size: 21.0,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              Expanded(
                child: bottomSheetContent,
              ),
            ],
          ),
        );
      },
    );
  }
}
