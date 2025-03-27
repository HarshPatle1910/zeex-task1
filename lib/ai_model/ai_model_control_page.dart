import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'active_model_status.dart';
import 'add_new_model_screen.dart';
import 'assign_ai_model_to_devices.dart';
import 'available_model_is_screen.dart';
import 'controllers/assign_model_controller.dart';
import 'model_configuration_screen.dart';

// UI Screen
class AssignModelScreen extends StatelessWidget {
  final AssignModelController controller = Get.put(AssignModelController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(16.0),
                // width:
                //     constraints.maxWidth > 800 ? 800 : constraints.maxWidth * 0.9,
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header section
                        Container(
                          padding: EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(
                                "AI Model Control",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text("System Analysis"),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_alert),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.settings),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                  "assets/images/user_icon.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.black, height: 20),
                        //Body section
                        AssignAiModelToDevices(),
                        SizedBox(height: 12),
                        AvailableModelsScreen(),
                        SizedBox(height: 12),
                        ModelConfigurationScreen(),
                        SizedBox(height: 12),
                        ActiveModelStatusScreen(),
                        SizedBox(height: 12),
                        AddNewModelScreen(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
