import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_cancerline/presentation/screens/auth_screens/create_account/page1_choose_role_account_screen.dart';
import 'package:project_cancerline/presentation/screens/auth_screens/create_account/page2_personal_information_screen.dart';
import 'package:project_cancerline/presentation/screens/auth_screens/create_account/page3_account_info_screen.dart';
import 'package:project_cancerline/presentation/screens/auth_screens/create_account/page4_account_pin_screen.dart';
import 'package:project_cancerline/presentation/screens/auth_screens/create_account/page5_confirmation_screen.dart';

import 'package:project_cancerline/presentation/themes/themestyle.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: Page3AccountInfoScreen(),
    );
  }
}
