import 'package:flutter/material.dart';

class SystemAnalyticsWidget extends StatelessWidget {
  const SystemAnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "System Analytics",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Total Incidents Today
          _buildAnalyticsRow(
            title: "Total Incidents Today",
            value: "24",
            progress: 0.8,
            progressColor: Colors.blue,
          ),
          const SizedBox(height: 12),
          // High Risk Alerts
          _buildAnalyticsRow(
            title: "High Risk Alerts",
            value: "8",
            progress: 0.4,
            progressColor: Colors.red,
          ),
          const SizedBox(height: 12),
          // System Health
          _buildAnalyticsRow(
            title: "System Health",
            value: "98%",
            progress: 0.98,
            progressColor: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsRow({
    required String title,
    required String value,
    required double progress,
    required Color progressColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 14)),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress,
          color: progressColor,
          backgroundColor: Colors.grey[200],
        ),
      ],
    );
  }
}
