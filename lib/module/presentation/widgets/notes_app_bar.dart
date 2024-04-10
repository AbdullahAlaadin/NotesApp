import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/constance.dart';

class NotesAppBarBody extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool canPressed;
  final void Function()? onTap;

  const NotesAppBarBody({
    Key? key,
    required this.title,
    this.icon,
    this.onTap,
    this.canPressed = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
        ),
        if (canPressed && icon != null)
          InkWell(
            highlightColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            onTap: onTap,
            child: Container(
              height: 45,
              width: 45,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppConstance.isDark(context) ? Colors.grey.shade700 : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 26,
                color: AppConstance.isDark(context) ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
          ),
      ],
    );
  }
}
