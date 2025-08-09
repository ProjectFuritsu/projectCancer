import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';

class CustomCardSelection extends StatefulWidget {
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
  State<CustomCardSelection> createState() => _CustomCardSelectionState();
}

class _CustomCardSelectionState extends State<CustomCardSelection> {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.95);
  void _onTapUp(_) {
    setState(() => _scale = 1.0);
    widget.onTap?.call();
  }

  void _onTapCancel() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: Container(
          width: 140,
          height: 180,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppTheme.complementaryColorLightRed,
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
                widget.icon,
                size: widget.iconSize ?? 48,
                color: widget.iconColor ?? AppTheme.complementaryColorSolidRed,
              ),
              const SizedBox(height: 24),
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: widget.textColor ?? AppTheme.complementaryColorSolidRed,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
