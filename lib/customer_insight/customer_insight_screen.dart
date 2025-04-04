import 'package:flutter/material.dart';

class customer_insight_dashboard extends StatefulWidget {
  const customer_insight_dashboard({super.key, required this.title});

  final String title;

  @override
  State<customer_insight_dashboard> createState() =>
      _customer_insight_dashboardState();
}

class _customer_insight_dashboardState
    extends State<customer_insight_dashboard> {
  final List<double> customerTrends = [50, 80, 65, 90, 100, 70, 85];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMetricRow(),
            _buildFilterOptions(),
            _buildSectionTitle('Daily Crowd Level'),
            _buildProgressIndicator(0.75, Colors.blue),
            _buildSectionTitle('Monthly Average Crowd'),
            _buildProgressIndicator(0.6, Colors.green),
            _buildSectionTitle('Customer Revisit Rate'),
            _buildProgressIndicator(0.5, Colors.orange),
            _buildSectionTitle('Customer Demographics'),
            Row(
              children: [
                Expanded(child: _buildMetricCard('Age Group 25-34', '45%')),
                Expanded(child: _buildMetricCard('Male Customers', '60%')),
              ],
            ),
            _buildSectionTitle('Customer Growth'),
            _buildGrowthIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow() {
    return Row(
      children: [
        Expanded(child: _buildMetricCard('Total Customers', '24,892')),
        Expanded(child: _buildMetricCard('Returning Customers', '15,473')),
        Expanded(child: _buildMetricCard('New Customers', '9,419')),
      ],
    );
  }

  Widget _buildMetricCard(String title, String value) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProgressIndicator(double value, Color color) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGrowthIndicator() {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      color: Colors.green[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(Icons.trending_up, color: Colors.green),
            const SizedBox(width: 10),
            const Text(
              'Customer visits increased by 15% this month',
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOptions() {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter Options',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Today')),
                ElevatedButton(onPressed: () {}, child: Text('This Week')),
                ElevatedButton(onPressed: () {}, child: Text('This Month')),
                ElevatedButton(onPressed: () {}, child: Text('Custom')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
