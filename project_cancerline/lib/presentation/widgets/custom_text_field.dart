import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool enabled;
  final int? maxLength;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.label,
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.maxLength,
    this.textAlign,
    this.focusNode,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLength: maxLength,
          textAlign: textAlign ?? TextAlign.start,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          enabled: enabled,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            counterText: maxLength != null
                ? ''
                : null, // 👈 Hides character counter
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 18,
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }
}
