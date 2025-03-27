import 'package:flutter/material.dart';
import 'package:task1/home/responsive_scaffold.dart';
import 'package:task1/home/sidebar_menu_item.dart';

class NavigationSidebar extends StatelessWidget {
  final DashboardController controller;

  const NavigationSidebar({Key? key, required this.controller})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo/Header
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blue.shade700,
            child: Row(
              children: [
                const Icon(Icons.shield, color: Colors.white),
                const SizedBox(width: 10),
                const Text(
                  "ZeexAI",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Navigation Menu
          Expanded(
            child: ListView(
              children: [
                SidebarMenuItem(
                  title: "Dashboard",
                  icon: Icons.dashboard,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Live Feed",
                  icon: Icons.videocam,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Incidents",
                  icon: Icons.incomplete_circle,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "AI Models Control",
                  icon: Icons.report,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Safety Level",
                  icon: Icons.health_and_safety,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Devices",
                  icon: Icons.devices,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Employee Management",
                  icon: Icons.supervised_user_circle_rounded,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Customer Insights",
                  icon: Icons.pie_chart_rounded,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Graph & Analytics",
                  icon: Icons.auto_graph_outlined,
                  controller: controller,
                ),
                SidebarMenuItem(
                  title: "Settings",
                  icon: Icons.settings,
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
