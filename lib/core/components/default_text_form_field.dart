import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_notes/core/utils/constance.dart';

import '../utils/colors.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?)? validate;
  final Function()? onTap;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? label;
  final String? hint;
  final void Function(String?)? onChange;
  final bool isPassword;
  final bool readOnly;
  final bool autoFocus;
  final void Function(String)? onSubmitted;
  final bool disableFieldStyle;
  final TextInputAction? nextInputAction;
  final FocusNode? focusNode;
  final bool? showCursor;
  final TextSelectionControls? cursorHandler;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final String? helperText;

  const DefaultTextFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.validate,
    this.onTap,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.label,
    this.hint,
    this.onChange,
    this.focusNode,
    this.showCursor,
    this.cursorHandler,
    this.isPassword = false,
    this.onSubmitted,
    this.readOnly = false,
    this.autoFocus = false,
    this.disableFieldStyle = false,
    this.nextInputAction,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.textAlignVertical,
    this.textAlign,
    this.inputFormatters,
    this.helperText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: maxLines != null ? null : 50,
      child: TextFormField(
        autofocus: autoFocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines,
        minLines: minLines,
        readOnly: readOnly,
        maxLength: maxLength,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
        focusNode: focusNode,
        showCursor: showCursor,
        cursorColor: AppConstance.isDark(context) ? AppColors.whiteColor : AppColors.blackColor,
        selectionControls: cursorHandler,
        controller: controller,
        keyboardType: type,
        validator: validate,
        onChanged: onChange,
        obscureText: isPassword,
        onTap: onTap,
        textInputAction: nextInputAction,
        onFieldSubmitted: onSubmitted,
        style: TextStyle(
          color: AppConstance.isDark(context) ? AppColors.whiteColor : AppColors.blackColor,
          fontSize: 13,
        ),
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          // to avoid collapse in error while content padding is applied
          errorStyle: const TextStyle(
            height: 0,
          ),
          helperText: helperText,
          helperStyle: const TextStyle(color: Colors.green),
          counterText: '',
          labelText: label,
          hintText: hint,
          labelStyle: disableFieldStyle
              ? Theme.of(context).textTheme.bodySmall
              : Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppConstance.isDark(context) ? AppColors.whiteColor : AppColors.blackColor,
                  ),
          hintStyle: Theme.of(context).textTheme.bodySmall,
          prefixIcon: prefixIcon,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 60,
          ),
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(
            minWidth: 60,
          ),
          prefixText: prefixText,
          prefixStyle: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.normal,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppConstance.isDark(context) ? Colors.white24 : AppColors.blackColor.withOpacity(0.2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppConstance.isDark(context) ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
