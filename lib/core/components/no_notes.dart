import 'package:flutter/material.dart';
import 'package:my_notes/core/utils/constance.dart';

import '../utils/colors.dart';
import '../utils/image_manager.dart';

class NoNotes extends StatelessWidget {
  const NoNotes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            ImageManager.noNotesImage,
            scale: 5,
          ),
        ),
        // Center(
        //   child: Text(
        //     '',
        //     style: Theme.of(context).textTheme.bodyMedium,
        //   ),
        // ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Add your first note..!',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppConstance.isDark(context) ? AppColors.whiteColor : AppColors.blackColor,
              ),
        ),
      ],
    );
  }
}
