// recent_alert_screen.dart

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../incident/incident_dashboard.dart';

class RecentAlertsSection extends StatefulWidget {
  const RecentAlertsSection({Key? key}) : super(key: key);

  @override
  State<RecentAlertsSection> createState() => _RecentAlertsSectionState();
}

class _RecentAlertsSectionState extends State<RecentAlertsSection> {
  List<dynamic> alerts = [];

  Future<void> fetchAlerts() async {
    try {
      final response = await http.get(
        Uri.parse('http://65.0.118.209:5000/get_alerts?user_id=user_001'),
      );

      if (response.statusCode == 200) {
        setState(() {
          alerts = jsonDecode(response.body);
        });
      } else {
        debugPrint('Failed to fetch alerts: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint("Error fetching alerts: $e");
    }
  }

  late Timer _alertTimer;

  @override
  void initState() {
    super.initState();
    fetchAlerts();
    _alertTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      fetchAlerts();
    });
  }

  @override
  void dispose() {
    _alertTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Alerts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // ElevatedButton(onPressed: () {}, child: const Text("View all")),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IncidentDashboard(),
                    ),
                  );
                },
                child: Text("View all"),
              ),
            ],
          ),
        ),
        Expanded(
          child:
              alerts.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      final alert = alerts[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: ListTile(
                          leading: Icon(
                            Icons.warning_amber_rounded,
                            color: getSeverityColor(alert['severity']),
                          ),
                          title: Text("🚨 ${alert['violation_type']}"),
                          subtitle: Text(
                            "Confidence: ${alert['confidence']}\nSeverity: ${alert['severity']}",
                          ),
                          trailing: Text(
                            alert['timestamp'].toString().substring(11, 19),
                          ),
                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }

  Color getSeverityColor(String? severity) {
    switch (severity) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
