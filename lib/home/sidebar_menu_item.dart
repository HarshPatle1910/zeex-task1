import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task1/home/responsive_scaffold.dart';

class SidebarMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final DashboardController controller;

  const SidebarMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isSelected = controller.currentPage.value == title;

      return ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.blue.shade700 : Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.blue.shade700 : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        selectedTileColor: Colors.blue.shade100,
        onTap: () => controller.updatePage(title),
      );
    });
  }
}
