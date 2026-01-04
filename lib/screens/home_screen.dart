import 'package:flutter/material.dart';
import 'package:task_manager_app/screens/dashboard_screen.dart';
import 'package:task_manager_app/screens/deadlines_screen.dart';
import 'package:task_manager_app/screens/timeline_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const DeadlinesScreen(),
    const TimelineScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNavItem(Icons.grid_view_rounded, 0),
                _buildNavItem(Icons.inbox_outlined, 1),
                _buildNavItem(Icons.calendar_today_outlined, 2),
                _buildNavItem(Icons.people_outline, 3),
                _buildNavItem(Icons.settings_outlined, 4),
                _buildNavItem(Icons.help_outline, 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        if (index < 3) {
          setState(() => _selectedIndex = index);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B2C) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey[400],
          size: 24,
        ),
      ),
    );
  }
}
