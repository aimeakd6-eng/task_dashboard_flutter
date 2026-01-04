import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class DeadlineCard extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;

  const DeadlineCard({super.key, required this.title, required this.status, required this.statusColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(backgroundColor: AppColors.background, child: Icon(Icons.web, color: AppColors.primaryOrange)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text("Project Brief", style: TextStyle(fontSize: 12, color: AppColors.textGrey, decoration: TextDecoration.underline)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            // ignore: deprecated_member_use
            decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Text(status, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}