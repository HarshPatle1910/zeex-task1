import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/add_model_controller.dart';

// Add New Model Screen
class AddNewModelScreen extends StatelessWidget {
  AddNewModelScreen({super.key});

  final AddModelController controller = Get.put(AddModelController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add New Model',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Section: Drag and Drop + Form Inputs
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Drag and Drop Area
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.cloud_upload,
                              size: 40,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Drag and drop your model file here',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Supported formats: .tflite, .pb, .onnx',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Model Name Field
                    TextField(
                      onChanged: (value) => controller.modelName.value = value,
                      decoration: InputDecoration(
                        labelText: 'Model Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Model Type Dropdown
                    Obx(
                      () => DropdownButtonFormField<String>(
                        value: controller.modelType.value,
                        items: const [
                          DropdownMenuItem(
                            value: 'Classification',
                            child: Text('Classification'),
                          ),
                          DropdownMenuItem(
                            value: 'Detection',
                            child: Text('Detection'),
                          ),
                          DropdownMenuItem(
                            value: 'Segmentation',
                            child: Text('Segmentation'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            controller.modelType.value = value;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Model Type',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right Section: Compatible Devices + Add Button
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Compatible Devices',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    // Checkbox Options
                    Obx(
                      () => CheckboxListTile(
                        value: controller.cctvSelected.value,
                        onChanged: (value) => controller.toggleCheckbox('CCTV'),
                        title: const Text('CCTV Cameras'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Obx(
                      () => CheckboxListTile(
                        value: controller.motionSensorsSelected.value,
                        onChanged:
                            (value) => controller.toggleCheckbox('Motion'),
                        title: const Text('Motion Sensors'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Obx(
                      () => CheckboxListTile(
                        value: controller.thermalCamerasSelected.value,
                        onChanged:
                            (value) => controller.toggleCheckbox('Thermal'),
                        title: const Text('Thermal Cameras'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Add Model Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Add Model action
                          Get.snackbar(
                            'Model Added',
                            'Model "${controller.modelName.value}" has been added successfully!',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('+ Add Model'),
                      ),
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
}
