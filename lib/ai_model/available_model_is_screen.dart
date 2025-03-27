// Controller to manage table data
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/available_model_is_controller.dart';

class AvailableModelsScreen extends StatelessWidget {
  final ModelsController controller = Get.put(ModelsController());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.white,
          width:
              constraints.maxWidth > 800
                  ? MediaQuery.of(context).size.width
                  : constraints.maxWidth * 0.9,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Available AI Models",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Obx(() {
                  return DataTable(
                    headingRowColor: MaterialStateProperty.all(
                      Colors.grey.shade200,
                    ),
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Model',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Purpose',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Supported Devices',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    rows:
                        controller.modelsList.map((model) {
                          return DataRow(
                            cells: [
                              DataCell(Text(model['model']!)),
                              DataCell(Text(model['purpose']!)),
                              DataCell(Text(model['devices']!)),
                              DataCell(
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        model['status'] == 'Active'
                                            ? Colors.green.shade100
                                            : Colors.red.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    model['status']!,
                                    style: TextStyle(
                                      color:
                                          model['status'] == 'Active'
                                              ? Colors.green
                                              : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
