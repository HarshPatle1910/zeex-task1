import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GraphAnalyticsController extends GetxController {
  // Line Chart Spots
  var lineChartSpots =
      [
        FlSpot(0, 1),
        FlSpot(1, 3),
        FlSpot(2, 2),
        FlSpot(3, 1.5),
        FlSpot(4, 4),
      ].obs;
}

class GraphAnalyticsSectionForDashboard extends StatelessWidget {
  final GraphAnalyticsController controller = Get.put(
    GraphAnalyticsController(),
  );

  GraphAnalyticsSectionForDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Graph & Analytics",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
              return GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: crossAxisCount > 1 ? 1.3 : 1.1,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildGraphCard(
                      title: "Line Chart",
                      child: Obx(
                        () => LineChart(
                          LineChartData(
                            minX: 0,
                            maxX: 4,
                            minY: 0,
                            maxY: 5,
                            gridData: FlGridData(show: false),
                            borderData: FlBorderData(
                              show: true,
                              border: const Border(
                                bottom: BorderSide(color: Colors.grey),
                                left: BorderSide(color: Colors.grey),
                              ),
                            ),
                            titlesData: FlTitlesData(show: true),
                            lineBarsData: [
                              LineChartBarData(
                                spots: controller.lineChartSpots,
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 2,
                                belowBarData: BarAreaData(show: false),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return _buildGraphCard(
                      title: "System Analytics",
                      child: _buildSystemAnalytics(),
                    );
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGraphCard({required String title, required Widget child}) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Flexible(child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemAnalytics() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAnalyticsRow(
          title: "Total Incidents Today",
          value: "24",
          progress: 0.8,
          progressColor: Colors.blue,
        ),
        const SizedBox(height: 12),
        _buildAnalyticsRow(
          title: "High Risk Alerts",
          value: "8",
          progress: 0.4,
          progressColor: Colors.red,
        ),
        const SizedBox(height: 12),
        _buildAnalyticsRow(
          title: "System Health",
          value: "98%",
          progress: 0.98,
          progressColor: Colors.green,
        ),
      ],
    );
  }

  Widget _buildAnalyticsRow({
    required String title,
    required String value,
    required double progress,
    required Color progressColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 14)),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress,
          color: progressColor,
          backgroundColor: Colors.grey[200],
        ),
      ],
    );
  }
}
