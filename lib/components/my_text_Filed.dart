import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormFiled extends StatelessWidget {
  final EdgeInsetsGeometry? contentpadding;
  final InputBorder? foucedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hinttext;
  final bool? isObscreText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  const AppTextFormFiled(
      {super.key,
      this.onChanged,
      this.contentpadding,
      this.foucedBorder,
      this.enabledBorder,
      this.inputTextStyle,
      this.hintStyle,
      required this.hinttext,
      this.isObscreText,
      this.suffixIcon,
      this.prefixIcon,
      this.backgroundColor,
      this.controller,
      required this.validator,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentpadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        focusedBorder: foucedBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.blue, width: 1.3)),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.blue, width: 1.3)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.3),
            borderRadius: BorderRadius.circular(16)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
        ),
        hintStyle: hintStyle ?? TextStyle(fontSize: 14, color: Colors.grey),
        hintText: hinttext,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      obscureText: isObscreText ?? false,
      validator: (val) {
        return validator(val);
      },
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
