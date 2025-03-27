import 'package:flutter/material.dart';

class MidPage extends StatelessWidget {
  const MidPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Security Dashboard",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Icon(Icons.notifications, color: Colors.black54),
                  SizedBox(width: 10),
                  CircleAvatar(backgroundColor: Colors.grey),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Live Feed
          const Text("Live Feed", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _cameraView("Camera 1 - Main Entrance")),
              const SizedBox(width: 10),
              Expanded(child: _cameraView("Camera 2 - Parking")),
            ],
          ),

          const SizedBox(height: 20),
          const Text("Graph & Analytics", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          // Graphs & System Analytics
          Row(
            children: [
              Expanded(child: _analyticsCard("Activity Timeline")),
              const SizedBox(width: 10),
              Expanded(child: _analyticsCard("System Analytics")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cameraView(String title) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(title, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _analyticsCard(String title) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 1),
        ],
      ),
      child: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
