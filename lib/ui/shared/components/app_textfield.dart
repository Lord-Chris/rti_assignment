import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/_constants.dart';

class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? initialValue;
  final bool obscureText;
  final InputBorder? border;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? bottomRightWidget;
  final bool readOnly;
  final bool expands;
  final bool hasBorder;
  final int? minLines, maxLines, maxLength;
  final bool enabled;
  final Color? fillColor;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.border,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.obscureText = false,
    this.prefix,
    this.initialValue,
    this.focusNode,
    this.readOnly = false,
    this.expands = false,
    this.hasBorder = true,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.enabled = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.fillColor,
    this.onTap,
    this.onEditingComplete,
    this.decoration,
    this.textAlign,
    this.textAlignVertical,
    this.bottomRightWidget,
    this.inputFormatters,
  })  : assert(initialValue == null || controller == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      keyboardType: keyboardType,
      cursorWidth: 1,
      textCapitalization: textCapitalization,
      obscureText: obscureText,
      obscuringCharacter: '●',
      readOnly: readOnly,
      focusNode: focusNode,
      expands: expands,
      maxLines: maxLines,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      minLines: minLines,
      // maxLength: maxLength,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
        ...inputFormatters ?? []
      ],
      textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
      textAlign: textAlign ?? TextAlign.start,
      onEditingComplete:
          onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
      style: AppTextStyles.regular16.copyWith(
        height: 1,
      ),
      decoration: decoration ??
          kOutlineDecoration().copyWith(
            hintText: hint,
            labelText: label,
            suffixIcon: (suffix != null)
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: suffix!,
                      ),
                    ],
                  )
                : null,
            prefixIcon: (prefix != null)
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.r),
                        child: prefix!,
                      ),
                    ],
                  )
                : null,
            enabled: enabled,
            border: border,
            alignLabelWithHint:
                maxLines != null && keyboardType == TextInputType.multiline,
          ),
    );
  }

  static InputDecoration kOutlineDecoration() => InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
        isDense: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderGrey),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderGrey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderGrey),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: AppTextStyles.regular16.copyWith(
          color: AppColors.hintGrey,
        ),
      );
}

class AppDropdownField<T extends Object> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final Widget Function(T)? customItem;
  final String Function(T)? displayItem;
  final String? label, hint;
  final String? headingText;
  final Widget? prefix;
  final FocusNode? focusNode;
  final bool enabled;
  final Color? fillColor;
  final bool hasBorder;

  const AppDropdownField({
    Key? key,
    required this.items,
    required this.value,
    this.onChanged,
    this.validator,
    this.label,
    this.hint,
    this.headingText,
    this.prefix,
    this.enabled = true,
    this.fillColor,
    this.focusNode,
    this.customItem,
    this.displayItem,
    this.hasBorder = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      items: items.map(
        (T item) {
          if (customItem != null) {
            return DropdownMenuItem(
              value: item,
              child: customItem!(item),
            );
          }
          return DropdownMenuItem(
            value: item,
            child: Text(
              displayItem != null ? displayItem!(item) : item.toString(),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: DefaultTextStyle.of(context).style,
            ),
          );
        },
      ).toList(),
      isExpanded: true,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      value: value,
      focusNode: focusNode,
      icon: Icon(
        Icons.arrow_drop_down_sharp,
        color: AppColors.blue,
        size: 0.sp,
      ),
      style: AppTextStyles.regular16.copyWith(
        height: 1.2,
      ),
      decoration: AppTextField.kOutlineDecoration().copyWith(
        hintText: hint,
        prefixIcon: prefix,
        enabled: enabled,
        suffixIcon: Icon(
          Icons.arrow_drop_down_sharp,
          color: AppColors.blue,
          size: 25.sp,
        ),
      ),
    );
  }
}
