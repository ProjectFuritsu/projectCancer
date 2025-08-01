import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_cancerline/presentation/themes/themestyle.dart';
import 'package:project_cancerline/presentation/widgets/custom_elevated_button.dart';
import 'package:project_cancerline/presentation/widgets/custom_text_field.dart';

class Page4AccountPinScreen extends StatefulWidget {
  const Page4AccountPinScreen({super.key});

  @override
  State<Page4AccountPinScreen> createState() => _Page4AccountPinScreenState();
}

class _Page4AccountPinScreenState extends State<Page4AccountPinScreen> {
  final List<FocusNode> _focusNodes = List.generate(5, (_) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(5, (_) => TextEditingController());
  bool _obscurePin = true;

  @override
  void dispose() {
    for (final node in _focusNodes) {
      node.dispose();
    }
    for (final ctrl in _controllers) {
      ctrl.dispose();
    }
    super.dispose();
  }

  void _onPinChanged(int index, String value) {
    if (value.length == 1 && index < 4) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String _getEnteredPin() {
    return _controllers.map((c) => c.text).join();
  }

  void _onSubmitPin() {
    final pin = _getEnteredPin();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Your PIN: $pin')),
    );
  }

  void _togglePinVisibility() {
    setState(() {
      _obscurePin = !_obscurePin;
    });
  }

  Widget _buildDescription() {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          'Would you like to use a 5-digit PIN for faster sign-ins?',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'A quick PIN lets you open the app securely without typing your password each time.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.secondaryColor,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPinFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return SizedBox(
          width: 50,
          child: CustomTextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            isPassword: _obscurePin,
            maxLength: 1,
            textAlign: TextAlign.center,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            onChanged: (value) => _onPinChanged(index, value),
          ),
        );
      }),
    );
  }

  Widget _buildToggleVisibilityButton() {
    return IconButton(
      icon: Icon(
        _obscurePin ? Icons.visibility_off : Icons.visibility,
        color: AppTheme.primaryColor,
      ),
      onPressed: _togglePinVisibility,
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      child: CustomElevatedButton(
        label: 'Next',
        onPressed: _onSubmitPin,
        backgroundColor: AppTheme.primaryColor,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 60.0),
        borderRadius: 12.0,
        textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 18,
              color: AppTheme.defaultbackgroundColor,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: 0.80,
            backgroundColor: AppTheme.defaultbackgroundColor,
            valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 24.0),
          child: Column(
            children: [
              _buildDescription(),
              const SizedBox(height: 124),
              _buildPinFields(),
              const SizedBox(height: 32),
              _buildToggleVisibilityButton(),
              const SizedBox(height: 64),
              _buildNextButton(),
            ],
          ),
        ),
      ),
    );
  }
}
