import 'package:flutter/material.dart';

class DeviceManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Device Management System"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("+ Add Device"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              childAspectRatio: 3,
              children: [
                _buildStatCard(
                  "Total Devices",
                  "50",
                  Icons.devices,
                  Colors.blue,
                ),
                _buildStatCard(
                  "Active Devices",
                  "45",
                  Icons.check_circle,
                  Colors.green,
                ),
                _buildStatCard(
                  "Inactive Devices",
                  "3",
                  Icons.power_settings_new,
                  Colors.grey,
                ),
                _buildStatCard("Faulty Devices", "2", Icons.error, Colors.red),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.blue),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Two devices are reporting network issues. Suggest switching to a backup connection.",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Device Type Breakdown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                _buildBreakdownCard("CCTV Cameras", "30", Colors.purple),
                _buildBreakdownCard("Sensors", "10", Colors.green),
                _buildBreakdownCard("Alarms", "5", Colors.red),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Device List and Status",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search devices...",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(onPressed: () {}, child: Text("Filter")),
                    ],
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildDeviceRow(
                          "D-001",
                          "CCTV-Entrance",
                          "CCTV Camera",
                          "Main Entrance",
                          "Active",
                          "2025-03-19, 14:30",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String count,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    count,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
              Icon(icon, color: color, size: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreakdownCard(String type, String count, Color color) {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(Icons.devices_other, color: color, size: 28),
              SizedBox(height: 5),
              Text(type, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                count,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeviceRow(
    String id,
    String name,
    String type,
    String location,
    String status,
    String lastActive,
  ) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text("$name ($id)"),
        subtitle: Text("$type - $location"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chip(
              label: Text(status, style: TextStyle(color: Colors.white)),
              backgroundColor: status == "Active" ? Colors.green : Colors.red,
            ),
            SizedBox(width: 10),
            Text(lastActive, style: TextStyle(color: Colors.grey.shade600)),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.blue),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.orange),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
