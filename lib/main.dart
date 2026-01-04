import 'package:flutter/material.dart';
import 'package:task_manager_app/screens/dashboard_screen.dart';
import 'package:task_manager_app/screens/deadlines_screen.dart';
import 'package:task_manager_app/screens/timeline_screen.dart';

void main() {
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6B2C),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const DeadlinesScreen(),
    const TimelineScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navIcon(Icons.grid_view_rounded, 0),
              _navIcon(Icons.inbox_outlined, 1),
              _navIcon(Icons.calendar_today_outlined, 2),
              _navIcon(Icons.people_outline, 3),
              _navIcon(Icons.settings_outlined, 4),
              _navIcon(Icons.help_outline, 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        if (index < 3) setState(() => _currentIndex = index);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFFF6B2C) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.grey[400],
          size: 24,
        ),
      ),
    );
  }
}
