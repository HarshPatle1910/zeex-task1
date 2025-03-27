import 'package:flutter/material.dart';

class RecentAlertsSection extends StatelessWidget {
  final List<Map<String, String>> recentAlerts = [
    {
      'title': 'Weapon Detected',
      'camera': 'Camera 1 - Main Entrance',
      'riskLevel': 'High Risk',
      'riskColor': 'red',
      'time': '2 mins ago',
    },
    {
      'title': 'Suspicious Activity',
      'camera': 'Camera 2 - Parking',
      'riskLevel': 'Medium Risk',
      'riskColor': 'orange',
      'time': '5 mins ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Alerts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Add your 'View All' functionality here
                        },
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recentAlerts.length,
                  itemBuilder: (context, index) {
                    final alert = recentAlerts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          leading: Icon(
                            Icons.warning_amber_rounded,
                            color: _getRiskColor(alert['riskColor']!),
                            size: 36,
                          ),
                          title: Text(
                            alert['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                alert['camera']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    alert['riskLevel']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: _getRiskColor(alert['riskColor']!),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    alert['time']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Live Notifications",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade100,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green,
                            maxRadius: 5,
                          ),
                          SizedBox(width: 10),
                          Text("All systems operational"),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.shade100,
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            maxRadius: 5,
                          ),
                          SizedBox(width: 10),
                          Text("AI Processing: Cloud Mode"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                //Quick Actions
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quick Actions",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue.shade50,
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Icon(Icons.lock, color: Colors.blue),
                                SizedBox(height: 10),
                                Text(
                                  "Lock Down",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.red.shade50,
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Icon(Icons.add_alert, color: Colors.red),
                                SizedBox(height: 10),
                                Text(
                                  "Alert All",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green.shade50,
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Icon(Icons.done_outline, color: Colors.green),
                                SizedBox(height: 10),
                                Text(
                                  "Mark Safe",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.deepPurple.shade50,
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Icon(Icons.call, color: Colors.deepPurple),
                                SizedBox(height: 10),
                                Text(
                                  "Emergency",
                                  style: TextStyle(color: Colors.deepPurple),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Color _getRiskColor(String riskColor) {
    switch (riskColor) {
      case 'red':
        return Colors.red;
      case 'orange':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }
}
