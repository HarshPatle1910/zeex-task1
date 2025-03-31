import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AISafetyController extends GetxController {
  var highPriority = 3.obs;
  var mediumPriority = 7.obs;
  var lowPriority = 12.obs;
  var mobileNotifications = true.obs;
  var emailNotifications = true.obs;
  var smsNotifications = true.obs;
  var phoneCalls = false.obs;
}

class AISafetyScreen extends StatelessWidget {
  final AISafetyController controller = Get.put(AISafetyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Safety Level Dashboard",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Beta",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.notifications),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/user_icon.png"),
                  ),
                ],
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatusCard(
                      "High Priority",
                      "Active High Security Alerts",
                      controller.highPriority,
                      Colors.red,
                    ),
                    _buildStatusCard(
                      "Medium Priority",
                      "Active Medium Security Alerts",
                      controller.mediumPriority,
                      Colors.orange,
                    ),
                    _buildStatusCard(
                      "Low Priority",
                      "Active Low Security Alerts",
                      controller.lowPriority,
                      Colors.blue,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Active Safety Levels
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Active Safety Levels",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("+ New Safety Level"),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildFilterDropdown("All Severity Levels"),
                          _buildFilterDropdown("All Locations"),
                          _buildFilterDropdown("All Devices"),
                          _buildFilterDropdown("All Status"),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      _buildTableHeader(),
                      Divider(),
                      _buildTableRow(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildNotificationPreferences(),
              SizedBox(height: 20),
              _buildInsights(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterDropdown(String text) {
    return DropdownButton<String>(
      value: text,
      icon: Icon(Icons.arrow_drop_down),
      items: [DropdownMenuItem(value: text, child: Text(text))],
      onChanged: (value) {},
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Violation Type",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              "Severity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              "Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              "Last Action",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              "Escalation Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(
              "Actions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.security, color: Colors.red),
                SizedBox(height: 6),
                Text("Weapon Detection"),
              ],
            ),
          ),
          Spacer(),
          _buildSeverityTag("High", Colors.red),
          Spacer(),
          _buildStatusTag("Active", Colors.green),
          Spacer(),
          Expanded(child: Text("Triggered Alarm - 14:30")),
          Spacer(),
          Expanded(child: _buildEscalationTag("Escalated to Security")),
          Spacer(),
          Expanded(child: TextButton(onPressed: () {}, child: Text("Edit"))),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildSeverityTag(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatusTag(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildEscalationTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildStatusCard(String title, String desc, RxInt count, Color color) {
    return Obx(
      () => Card(
        color: color.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${count.value}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(desc),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationPreferences() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notification Preferances",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Column(
            children: [
              ListTile(
                title: Text("Mobile Push Notification"),
                trailing: Obx(
                  () => Switch(
                    value: controller.mobileNotifications.value,
                    onChanged:
                        (val) => controller.mobileNotifications.value = val,
                  ),
                ),
              ),
              ListTile(
                title: Text("Email Notifications"),
                trailing: Obx(
                  () => Switch(
                    value: controller.emailNotifications.value,
                    onChanged:
                        (val) => controller.emailNotifications.value = val,
                  ),
                ),
              ),
              ListTile(
                title: Text("SMS Notifications"),
                trailing: Obx(
                  () => Switch(
                    value: controller.smsNotifications.value,
                    onChanged: (val) => controller.smsNotifications.value = val,
                  ),
                ),
              ),
              ListTile(
                title: Text("Phone Calls"),
                trailing: Obx(
                  () => Switch(
                    value: controller.phoneCalls.value,
                    onChanged: (val) => controller.phoneCalls.value = val,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInsights() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Icon(Icons.adb_outlined),
                  Text(
                    "AI Insights",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.insights, color: Colors.blue),
              title: Text("Detection Sensitivity"),
              subtitle: Text(
                "Weapon Detection triggered 3 times today. Consider adjusting sensitivity or response time.",
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.green),
              title: Text("Safety Configuration"),
              subtitle: Text(
                "Safety level for Front Door set to High during business hours.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
