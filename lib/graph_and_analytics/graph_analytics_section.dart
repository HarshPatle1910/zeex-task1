import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphAnalyticsSection extends StatelessWidget {
  const GraphAnalyticsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Text(
          "Graph & Analytics",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        // Responsive Grid
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Number of grid columns based on width
              int crossAxisCount = constraints.maxWidth > 1000 ? 2 : 1;
              return GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: constraints.maxWidth > 1000 ? 1.5 : 1.2,
                children: [
                  // Line Chart Card
                  _buildGraphCard(
                    title: "Line Chart",
                    child: LineChart(
                      LineChartData(
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
                            spots: [
                              FlSpot(0, 1),
                              FlSpot(1, 3),
                              FlSpot(2, 2),
                              FlSpot(3, 1.5),
                              FlSpot(4, 4),
                            ],
                            isCurved: true,
                            color: Colors.blue,
                            barWidth: 4,
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Pie Chart Card
                  _buildGraphCard(
                    title: "Pie Chart",
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: 40,
                            color: Colors.blue,
                            title: "40%",
                            radius: 50,
                          ),
                          PieChartSectionData(
                            value: 30,
                            color: Colors.orange,
                            title: "30%",
                            radius: 50,
                          ),
                          PieChartSectionData(
                            value: 20,
                            color: Colors.green,
                            title: "20%",
                            radius: 50,
                          ),
                          PieChartSectionData(
                            value: 10,
                            color: Colors.red,
                            title: "10%",
                            radius: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Bar Chart Card
                  _buildGraphCard(
                    title: "Bar Chart",
                    child: BarChart(
                      BarChartData(
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            bottom: BorderSide(color: Colors.grey),
                            left: BorderSide(color: Colors.grey),
                          ),
                        ),
                        titlesData: FlTitlesData(
                          show: true,
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) {
                                return Text('Q${value.toInt() + 1}');
                              },
                            ),
                          ),
                        ),
                        barGroups: [
                          BarChartGroupData(
                            x: 0,
                            barRods: [
                              BarChartRodData(toY: 5, color: Colors.blue),
                            ],
                          ),
                          BarChartGroupData(
                            x: 1,
                            barRods: [
                              BarChartRodData(toY: 7, color: Colors.orange),
                            ],
                          ),
                          BarChartGroupData(
                            x: 2,
                            barRods: [
                              BarChartRodData(toY: 6, color: Colors.green),
                            ],
                          ),
                          BarChartGroupData(
                            x: 3,
                            barRods: [
                              BarChartRodData(toY: 8, color: Colors.red),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Custom Analytics Card
                  _buildGraphCard(
                    title: "Custom Analytics",
                    child: Center(
                      child: Text(
                        "Add Your Custom Widget",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // Helper Method to Build Graph Card
  Widget _buildGraphCard({required String title, required Widget child}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Title
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Chart Widget
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
