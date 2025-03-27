import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/assign_model_controller.dart';

class AssignAiModelToDevices extends StatelessWidget {
  AssignAiModelToDevices({super.key});
  final AssignModelController controller = Get.put(AssignModelController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Assign AI Models to Devices",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDropdown(
                      title: "Select Device",
                      items: ['CCTV - Main Entrance', 'CCTV - Parking Lot'],
                      selectedValue: controller.selectedDevice,
                    ),
                    const SizedBox(height: 20),
                    _buildDropdown(
                      title: "Select Model",
                      items: [
                        'YOLOv8 - Weapon Detection',
                        'YOLOv8 - Intrusion Detection',
                        'YOLOv8 - Mask Detection',
                      ],
                      selectedValue: controller.selectedModel,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sensitivity",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Obx(() {
                      return DropdownButton<String>(
                        value: controller.sensitivity.value,
                        isExpanded: true,
                        onChanged: (value) {
                          controller.sensitivity.value = value!;
                        },
                        items:
                            ['Low', 'Medium', 'High'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                      );
                    }),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Assign action
                            Get.snackbar(
                              "Success",
                              "Model Assigned Successfully!",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          icon: const Icon(Icons.check),
                          label: const Text(
                            "Assign Model",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 20),
                        OutlinedButton.icon(
                          onPressed: () {
                            controller.resetFields();
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text("Reset"),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String title,
    required List<String> items,
    required RxString selectedValue,
  }) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          DropdownButton<String>(
            isExpanded: true,
            value: selectedValue.value,
            onChanged: (value) {
              selectedValue.value = value!;
            },
            items:
                items.map((item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
          ),
        ],
      );
    });
  }
}
