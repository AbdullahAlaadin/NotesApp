import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  final bool isSelected;
  final Color color;

  const ColorItem({
    Key? key,
    required this.isSelected,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: isSelected
          ? Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: color,
                ),
                Icon(
                  Icons.check,
                ),
              ],
            )
          : CircleAvatar(
              radius: 24,
              backgroundColor: color,
            ),
    );
  }
}
