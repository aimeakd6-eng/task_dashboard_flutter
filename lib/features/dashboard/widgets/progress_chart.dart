import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constants/app_colors.dart';

class ProgressChart extends StatelessWidget {
  const ProgressChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 65,
              sections: [
                PieChartSectionData(color: AppColors.primaryOrange, value: 40, radius: 18, showTitle: false),
                PieChartSectionData(color: Colors.yellow, value: 35, radius: 18, showTitle: false),
                PieChartSectionData(color: Colors.purple, value: 25, radius: 18, showTitle: false),
              ],
            ),
          ),
          const Text("\$ 6,550", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}