import 'package:flutter/material.dart';

class CCTVMonitorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: CCTVMonitorScreen(),
    );
  }
}

class CCTVMonitorScreen extends StatelessWidget {
  final List<Map<String, String>> cameras = [
    {'name': 'Entrance', 'status': 'Alert'},
    {'name': 'Cash Counter', 'status': ''},
    {'name': 'Storage', 'status': ''},
    {'name': 'Parking', 'status': ''},
  ];

  final List<Map<String, dynamic>> alerts = [
    {
      'type': 'Intrusion Detected',
      'location': 'Entrance - Camera #1',
      'time': 'Just now',
      'color': Colors.red,
    },
    {
      'type': 'Suspicious Activity',
      'location': 'Cash Counter - Camera #2',
      'time': '2m ago',
      'color': Colors.orange,
    },
    {
      'type': 'Mask Violation',
      'location': 'Storage - Camera #3',
      'time': '5m ago',
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CCTV Monitor',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.camera), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.fiber_manual_record, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ToggleButtons(
              children: [Text('Grid View'), Text('Single View')],
              isSelected: [true, false],
              onPressed: (index) {},
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: cameras.length,
                itemBuilder: (context, index) {
                  return CameraTile(camera: cameras[index]);
                },
              ),
            ),
            SizedBox(height: 10),
            AlertList(alerts: alerts),
          ],
        ),
      ),
    );
  }
}

class CameraTile extends StatelessWidget {
  final Map<String, String> camera;
  CameraTile({required this.camera});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade300,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.all(4),
            color: Colors.black54,
            child: Text(camera['name']!, style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

class AlertList extends StatelessWidget {
  final List<Map<String, dynamic>> alerts;
  AlertList({required this.alerts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AI Insights',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ...alerts.map(
          (alert) => ListTile(
            leading: Icon(Icons.warning, color: alert['color']),
            title: Text(
              alert['type'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(alert['location']),
            trailing: Text(alert['time'], style: TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
