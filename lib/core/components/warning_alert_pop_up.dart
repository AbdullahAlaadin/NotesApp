import 'package:flutter/material.dart';
import 'package:my_notes/core/extensions/context_ex.dart';

import '../utils/colors.dart';
import '../utils/image_manager.dart';
import 'default_filled_button.dart';

class WarningAlertPopUp extends StatelessWidget {
  final String? image;
  final String description;
  final String? btnContent;
  final Color? btnColor;
  final void Function()? onPress;

  const WarningAlertPopUp({
    super.key,
    this.image,
    required this.description,
    this.btnContent,
    this.btnColor,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Container(
          decoration: BoxDecoration(
            color: const Color(0xfffcfcff),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(
                  3,
                  3,
                ), // Shadow offset from right and bottom
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (btnContent == null)
                const SizedBox(
                  height: 16.0,
                ),
                if (btnContent != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          color: Colors.black,
                          icon: const Icon(
                            Icons.close,
                            size: 21.0,
                          ),
                        ),
                      ),
                    ],
                  ),

                SizedBox(
                  height: context.screenHeight / 4,
                  width: context.screenWidth,
                  child: Image.asset(
                    image ?? ImageManager.warningImage,
                  ),
                ),
                // const SizedBox(
                //   height: 25.0,
                // ),
                // Text(
                //   'Alert',
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.displaySmall?.copyWith(
                //         fontSize: 28.0,
                //         color: AppColors.redColor,
                //         fontWeight: FontWeight.bold,
                //       ),
                // ),
                const SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 1.5,
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          height: 1.8,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    child: DefaultFilledButton(
                      title: btnContent ?? 'Ok',
                      buttonColor: AppColors.redColor,
                      onPress: onPress ?? () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
