import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';

class CustomModalDatePickerField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final void Function(DateTime) onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool enabled;
  final String? Function(DateTime?)? validator;

  const CustomModalDatePickerField({
    super.key,
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.enabled = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = selectedDate != null
        ? DateFormat.yMMMMd().format(selectedDate!)
        : '';

    return GestureDetector(
      onTap: enabled ? () => _showDatePicker(context) : null,
      child: AbsorbPointer(
        child: TextFormField(
          readOnly: true,
          validator: (_) => validator?.call(selectedDate),
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
            suffixIcon: const Icon(Icons.calendar_today_rounded, color: AppTheme.primaryColor),
          ),
          controller: TextEditingController(text: formattedDate),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: firstDate ?? DateTime(1900),
      lastDate: lastDate ?? DateTime(now.year + 10),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppTheme.primaryColor),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }
}
