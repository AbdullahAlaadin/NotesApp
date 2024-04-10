import 'package:flutter/material.dart';
import 'package:my_notes/core/extensions/context_ex.dart';
import 'package:my_notes/core/utils/constance.dart';

import '../utils/colors.dart';

class DefaultFilledButton extends StatelessWidget {
  final String title;
  final void Function() onPress;
  final Color? buttonColor;

  const DefaultFilledButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 45,
        width: context.screenWidth,
        decoration: BoxDecoration(
          color: buttonColor ?? (AppConstance.isDark(context) ? AppColors.tealColor : AppColors.purpleColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: buttonColor != null ? AppColors.whiteColor : null,
            ),
          ),
        ),
      ),
    );
  }
}
