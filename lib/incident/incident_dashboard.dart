import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncidentDashboardController extends GetxController {
  var totalIncidents = 83.obs;
  var highSeverity = 22.obs;
  var avgResponseTime = 15.obs;
  var resolutionRate = 95.obs;
}

class IncidentDashboard extends StatelessWidget {
  final IncidentDashboardController controller = Get.put(
    IncidentDashboardController(),
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  "Incidents Dashboard",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Container(
                  child: Text("Live"),
                  decoration: BoxDecoration(
                    color: Colors.red.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  padding: EdgeInsets.all(8),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.add_alert)),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/user_icon.png"),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          _buildInsightsCard(context),
          SizedBox(height: 16),
          _buildMetricsRow(),
          SizedBox(height: 16),
          _buildChartsSection(),
          SizedBox(height: 16),
          _buildRecentIncidentsTable(),
          SizedBox(height: 16),
          _buildCustomRuleForm(),
        ],
      ),
    );
  }

  Widget _buildInsightsCard(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        child: Text(
          'AI Insight: Weapon Detection incidents increased by 30% near Main Entrance over the last month. Consider increasing security measures.',
          // style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildMetricsRow() {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildMetricCard(
            'Total Incidents',
            controller.totalIncidents.value,
            Colors.blue,
          ),
          _buildMetricCard(
            'High Severity',
            controller.highSeverity.value,
            Colors.red,
          ),
          _buildMetricCard(
            'Avg. Response Time',
            '${controller.avgResponseTime.value}s',
            Colors.orange,
          ),
          _buildMetricCard(
            'Resolution Rate',
            '${controller.resolutionRate.value}%',
            Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, dynamic value, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: 100,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              value.toString(),
              style: TextStyle(fontSize: 18, color: color),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartsSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildChartCard('Violation Frequency', Colors.yellow),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildChartCard(
                'Violation Type Distribution',
                Colors.pink,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        _buildChartCard('Location-Based Trends', Colors.orange),
      ],
    );
  }

  Widget _buildChartCard(String title, Color color) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        height: 200,
        color: color.withOpacity(0.1),
        child: Center(child: Text(title)),
      ),
    );
  }

  Widget _buildRecentIncidentsTable() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent Incidents',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('Date/Time')),
              DataColumn(label: Text('Location')),
              DataColumn(label: Text('Violation Type')),
              DataColumn(label: Text('Severity')),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('2025-03-18, 14:30')),
                  DataCell(Text('Main Entrance')),
                  DataCell(Text('Weapon Detection')),
                  DataCell(Text('High')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomRuleForm() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Custom Incident Rule',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildDropdown('Violation Type')),
                SizedBox(width: 8),
                Expanded(child: _buildDropdown('Severity')),
                SizedBox(width: 8),
                Expanded(child: _buildDropdown('Action')),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('Create Rule')),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return DropdownButtonFormField(
      decoration: InputDecoration(hintText: hint, border: OutlineInputBorder()),
      items: [
        DropdownMenuItem(child: Text('Option 1'), value: 'Option 1'),
        DropdownMenuItem(child: Text('Option 2'), value: 'Option 2'),
      ],
      onChanged: (value) {},
    );
  }
}
