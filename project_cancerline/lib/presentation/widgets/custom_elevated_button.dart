import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Widget? icon;
  final TextStyle? textStyle;
  final BorderSide? border;
  final AlignmentGeometry? alignment;
  final bool loading;


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
    this.loading = false,
  
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
      onPressed: loading ? null : onPressed,
      child: loading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon!,
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    label,
                    style: contentStyle,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          : Text(
              label,
              style: contentStyle,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
    );
  }
}
