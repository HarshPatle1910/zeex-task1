import 'package:flutter/material.dart';

import '../live_feed/graph_analytics_for_dashboard.dart';
import '../live_feed/live_feed_section.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Security Dashboard",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Real-Time surveillance monitoring",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.notifications),
              SizedBox(width: 10),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/user_icon.png"),
              ),
              SizedBox(width: 10),
              Text("John Smith", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 16),
          LiveFeedSection(),
          SizedBox(height: 16),
          Expanded(child: GraphAnalyticsSectionForDashboard()),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
