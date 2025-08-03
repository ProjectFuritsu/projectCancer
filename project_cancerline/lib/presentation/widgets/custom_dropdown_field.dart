import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';

class CustomModalDropdownField<T> extends StatelessWidget {
  final String? label;
  final T? value;
  final List<T> options;
  final String Function(T) displayText;
  final void Function(T)? onChanged;
  final String? Function(T?)? validator;
  final bool enabled;
  final Icon? icon;

  const CustomModalDropdownField({
    super.key,
    this.label,
    required this.value,
    required this.options,
    required this.displayText,
    required this.onChanged,
    this.validator,
    this.enabled = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? () => _openBottomSheet(context) : null,
      child: AbsorbPointer(
        child: TextFormField(
          readOnly: true,
          validator: (_) => validator?.call(value),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: Theme.of(context).textTheme.labelMedium,
            contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.primaryColor.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: icon ?? const Icon(Icons.keyboard_arrow_down_rounded, color: AppTheme.primaryColor),
          ),
          controller: TextEditingController(
            text: value != null ? displayText(value as T) : '',
          ),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet<T>(
      context: context,
      showDragHandle: true,
      backgroundColor: AppTheme.defaultbackgroundColor,
      isScrollControlled: true,
      builder: (_) {
        return SafeArea(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (_, index) {
              final item = options[index];
              final selected = item == value;
              return ListTile(
                title: Text(
                  displayText(item),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                        color: selected ? AppTheme.primaryColor : AppTheme.primaryColor,
                      ),
                ),
                trailing: selected ? const Icon(Icons.check, color: AppTheme.primaryColor) : null,
                onTap: () => Navigator.of(context).pop(item),
              );
            },
            separatorBuilder: (_, __) => const Divider(height: 0),
          ),
        );
      },
    );

    if (result != null && result != value) {
      onChanged?.call(result);
    }
  }
}
