import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/model_configure_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Model Configuration',
      home: ModelConfigurationScreen(),
    );
  }
}

// Main UI Screen
class ModelConfigurationScreen extends StatelessWidget {
  final ModelConfigController controller = Get.put(ModelConfigController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.white,
          width:
              constraints.maxWidth > 800
                  ? MediaQuery.of(context).size.width
                  : constraints.maxWidth * 0.9,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Model Configuration',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  // Sensitivity Section
                  _buildCard(
                    title: 'Sensitivity',
                    child: Obx(
                      () => SizedBox(
                        height: 200,
                        child: Column(
                          children:
                              ['Low', 'Medium', 'High'].map((level) {
                                return RadioListTile<String>(
                                  title: Text(level),
                                  value: level,
                                  groupValue: controller.sensitivity.value,
                                  onChanged: (value) {
                                    controller.sensitivity.value = value!;
                                  },
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // Trigger Time Section
                  _buildCard(
                    title: 'Trigger Time',
                    child: Obx(
                      () => SizedBox(
                        height: 200,
                        child: Column(
                          children: [
                            Slider(
                              value: controller.triggerTime.value,
                              min: 1,
                              max: 10,
                              divisions: 9,
                              label:
                                  '${controller.triggerTime.value.toInt()} seconds',
                              onChanged: (value) {
                                controller.triggerTime.value = value;
                              },
                            ),
                            Text(
                              '${controller.triggerTime.value.toInt()} seconds',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Alert Type Section
                  _buildCard(
                    title: 'Alert Type',
                    child: Obx(
                      () => SizedBox(
                        height: 200,
                        child: Column(
                          children:
                              controller.alertTypes.keys.map((alertType) {
                                return CheckboxListTile(
                                  title: Text(alertType),
                                  value: controller.alertTypes[alertType],
                                  onChanged: (value) {
                                    controller.alertTypes[alertType] = value!;
                                  },
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                  ),
                  // Actions Section
                  _buildCard(
                    title: 'Actions',
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          _buildActionButton(
                            'Trigger Alarm',
                            Colors.red.shade100,
                            Colors.red,
                          ),
                          const SizedBox(height: 8),
                          _buildActionButton(
                            'Capture Screenshot',
                            Colors.blue.shade100,
                            Colors.blue,
                          ),
                          const SizedBox(height: 8),
                          _buildActionButton(
                            'Auto-Lock Door',
                            Colors.orange.shade100,
                            Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper method to create a card widget
  Widget _buildCard({required String title, required Widget child}) {
    return Flexible(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create styled action buttons
  Widget _buildActionButton(String label, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {
        Get.snackbar('Action Triggered', label);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.circle, size: 12, color: textColor),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
