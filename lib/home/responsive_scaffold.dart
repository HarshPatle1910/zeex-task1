import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/graph_and_analytics/graph_analytics_section.dart';
import 'package:task1/members_pages/samya/device_management_page.dart';

import '../ai_model/ai_model_control_page.dart';
import '../alert/recent_alert_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../live_feed/live_feed_page.dart';
import 'navigation_sidebar.dart';

class DashboardController extends GetxController {
  var currentPage = 'Dashboard'.obs;

  void updatePage(String page) {
    currentPage.value = page;
  }
}

class ResponsiveScaffold extends StatelessWidget {
  final DashboardController _controller = Get.put(DashboardController());

  ResponsiveScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.grey.shade200,
        child: Row(
          children: [
            // Sidebar
            Expanded(
              // flex: 2,
              child: NavigationSidebar(controller: _controller),
            ),
            // Main Content Area
            Expanded(
              flex: 5,
              child: Obx(() {
                switch (_controller.currentPage.value) {
                  case 'Dashboard':
                    return DashboardScreen();
                  case 'Live Feed':
                    return LiveFeedPage();
                  case 'Incidents':
                    return MainDashboardContent();
                  case 'AI Models Control':
                    return AssignModelScreen();
                  case 'Safety Level':
                    return MainDashboardContent();
                  case 'Devices':
                    return DeviceManagementPage();
                  case 'Employee Management':
                    return MainDashboardContent();
                  case 'Customer Insights':
                    return MainDashboardContent();
                  case 'Graph & Analytics':
                    return GraphAnalyticsSection();
                  case 'Settings':
                    return MainDashboardContent();
                  default:
                    return MainDashboardContent();
                }
              }),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: context.mediaQuerySize.height,
                  width: 400,
                  color: Colors.white,
                  child: RecentAlertsSection(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainDashboardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Welcome to the Settings!",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
