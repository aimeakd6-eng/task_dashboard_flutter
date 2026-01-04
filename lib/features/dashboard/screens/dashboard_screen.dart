import 'package:flutter/material.dart';
import 'package:ai_assistant/core/constants/app_colors.dart';
import '../widgets/stat_card.dart';
import '../widgets/progress_chart.dart';
import '../widgets/deadline_card.dart';
import '../../../shared/widgets/custom_navbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.notes, size: 30),
                  CircleAvatar(radius: 20, backgroundImage: NetworkImage("https://i.pravatar.cc/150")),
                ],
              ),
              const SizedBox(height: 20),
              // AI Assistant Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(color: AppColors.primaryOrange, borderRadius: BorderRadius.circular(20)),
                child: const Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.auto_awesome, color: Colors.white, size: 16),
                  SizedBox(width: 8),
                  Text("AI Assistant", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ]),
              ),
              const SizedBox(height: 25),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.6,
                children: const [
                  StatCard(title: "Priority Task", value: "13/25", trend: "↑ 10%", isPositive: true, icon: Icons.assignment_outlined),
                  StatCard(title: "Overdue Task", value: "12/20", trend: "↑ 10%", isPositive: true, icon: Icons.error_outline),
                ],
              ),
              const SizedBox(height: 25),
              const Text("Task Progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              const ProgressChart(),
              const SizedBox(height: 25),
              const Text("Deadlines", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),
              const DeadlineCard(title: "Medical Website", status: "On Progress", statusColor: Colors.orange),
              const DeadlineCard(title: "Fluorenes Branding", status: "Completed", statusColor: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}