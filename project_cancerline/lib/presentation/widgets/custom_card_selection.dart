import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';

class CustomCardSelection extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final double? iconSize;

const CustomCardSelection({
  super.key,
  required this.icon,
  required this.label,
  this.onTap,
  this.backgroundColor,
  this.iconColor,
  this.textColor,
  this.iconSize, 
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        width: 140,
        height: 180,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.complementaryColorLightRed,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize ?? 48,
              color: iconColor ?? AppTheme.complementaryColorSolidRed,
            ),
            const SizedBox(height: 24),
            Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: textColor ?? AppTheme.complementaryColorSolidRed,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
