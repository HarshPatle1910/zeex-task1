import 'package:flutter/material.dart';

class LeftColumn extends StatelessWidget {
  const LeftColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.blueGrey[50],
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("ZeexAI", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _sidebarItem(Icons.dashboard, "Dashboard"),
          _sidebarItem(Icons.live_tv, "Live Feed"),
          _sidebarItem(Icons.report, "Incidents"),
          _sidebarItem(Icons.model_training, "AI Models Control"),
          _sidebarItem(Icons.security, "Safety Level"),
          _sidebarItem(Icons.devices, "Devices"),
          _sidebarItem(Icons.people, "Employee Management"),
          _sidebarItem(Icons.insights, "Customer Insights"),
          _sidebarItem(Icons.analytics, "Graph & Analytics"),
          _sidebarItem(Icons.settings, "Settings"),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black54),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
