import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';
import 'package:project_cancerline/presentation/widgets/custom_dropdown_field.dart';
import 'package:project_cancerline/presentation/widgets/custom_elevated_button.dart';
import 'package:project_cancerline/presentation/widgets/custom_modal_datepicker_field.dart';
import 'package:project_cancerline/presentation/widgets/custom_text_field.dart';

class Page2PersonalInformationScreen extends StatefulWidget {
  const Page2PersonalInformationScreen({super.key});

  @override
  State<Page2PersonalInformationScreen> createState() =>
      _Page2PersonalInformationScreenState();
}

class _Page2PersonalInformationScreenState
    extends State<Page2PersonalInformationScreen> {
  String? gender;
  DateTime? selectedDOB;
  String? maritalstatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: 0.40,
            backgroundColor: AppTheme.defaultbackgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text(
                'Tell us a little about yourself',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'We’ll only use this info to send helpful updates.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.primaryColor.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 36),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomTextField(hintText: "First Name"),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: CustomTextField(hintText: "Suffix"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(hintText: "Middle Name"),
                  const SizedBox(height: 16),
                  CustomTextField(hintText: "Last Name"),
                  const SizedBox(height: 16),
                  CustomModalDropdownField<String>(
                    label: 'Gender',
                    value: gender,
                    options: ['Male', 'Female'],
                    displayText: (g) => g,
                    onChanged: (val) => setState(() => gender = val),
                    validator: (val) =>
                        val == null ? 'Please select a gender' : null,
                  ),
                  const SizedBox(height: 16),
                  CustomModalDatePickerField(
                    label: 'Date of Birth',
                    selectedDate: selectedDOB,
                    onDateSelected: (date) =>
                        setState(() => selectedDOB = date),
                  ),
                  const SizedBox(height: 16),
                  CustomModalDropdownField<String>(
                    label: 'Marital Status',
                    value: maritalstatus,
                    options: ['Single', 'Married', 'Divorced', 'Widowed'],
                    displayText: (g) => g,
                    onChanged: (val) => setState(() => maritalstatus = val),
                    validator: (val) =>
                        val == null ? 'Please select a marital status' : null,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: "Phone Number",
                    keyboardType: TextInputType.phone,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
                      if (!phoneRegex.hasMatch(val)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: "Occupation",  
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter your occupation';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButton(
                        label: 'Next',
                        onPressed: () {},
                        backgroundColor: AppTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 60.0,
                        ),
                        borderRadius: 12.0,
                        textStyle: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontSize: 18, color: AppTheme.defaultbackgroundColor),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
