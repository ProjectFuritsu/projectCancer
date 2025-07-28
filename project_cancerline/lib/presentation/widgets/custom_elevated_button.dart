import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Widget? icon;
  final TextStyle? textStyle;
  final BorderSide? border;
  final AlignmentGeometry? alignment;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.borderRadius,
    this.icon,
    this.textStyle,
    this.border,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final color = backgroundColor ?? AppTheme.defaultbackgroundColor;
    final txtColor = textColor ?? AppTheme.primaryColor;
    final radius = borderRadius ?? 8.0;
    final contentStyle =
        textStyle ??
        Theme.of(context).textTheme.labelMedium?.copyWith(
          color: txtColor,
          fontWeight: FontWeight.w600,
        );

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: border ?? BorderSide.none,
        ),
      ),
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon!,
                const SizedBox(width: 8),
                Text(label, style: contentStyle, textAlign: TextAlign.center),
              ],
            )
          : Text(label, style: contentStyle, textAlign: TextAlign.center),
    );
  }
}
