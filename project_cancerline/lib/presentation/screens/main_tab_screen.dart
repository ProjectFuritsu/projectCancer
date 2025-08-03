import 'package:flutter/material.dart';
import 'package:project_cancerline/presentation/screens/home_screen.dart';
import 'package:project_cancerline/presentation/screens/journal/journal_screen.dart';
import 'package:project_cancerline/presentation/screens/feed/feed_screen.dart';
import 'package:project_cancerline/presentation/screens/profile/profile_screen.dart';
import 'package:project_cancerline/presentation/widgets/custom_navbar.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    JournalScreen(),
    FeedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
