import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isDarkMode = false.obs;
  var language = 'English'.obs;
  var timeZone = 'UTC-05:00'.obs;
  var autoUpdate = false.obs;
  var twoFactorAuth = false.obs;
}

class SettingsScreen extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: Icon(Icons.settings, color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customize your AI dashboard preferences and security settings',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ResponsiveRow(
              children: [
                SettingsCard(
                  title: 'General Settings',
                  children: [
                    Obx(
                      () => SwitchListTile(
                        title: Text('Dashboard Theme'),
                        value: controller.isDarkMode.value,
                        onChanged: (value) {
                          controller.isDarkMode.value = value;
                        },
                      ),
                    ),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        value: controller.language.value,
                        decoration: InputDecoration(labelText: 'Language'),
                        items:
                            ['English', 'Spanish', 'French']
                                .map(
                                  (lang) => DropdownMenuItem(
                                    child: Text(lang),
                                    value: lang,
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          controller.language.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        value: controller.timeZone.value,
                        decoration: InputDecoration(labelText: 'Time Zone'),
                        items:
                            ['UTC-05:00', 'UTC-06:00', 'UTC+01:00']
                                .map(
                                  (tz) => DropdownMenuItem(
                                    child: Text(tz),
                                    value: tz,
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          controller.timeZone.value = value!;
                        },
                      ),
                    ),
                    Obx(
                      () => SwitchListTile(
                        title: Text('Auto-Update'),
                        value: controller.autoUpdate.value,
                        onChanged: (value) {
                          controller.autoUpdate.value = value;
                        },
                      ),
                    ),
                  ],
                ),
                SettingsCard(
                  title: 'Security & Access',
                  children: [
                    Obx(
                      () => SwitchListTile(
                        title: Text('Two-Factor Auth'),
                        value: controller.twoFactorAuth.value,
                        onChanged: (value) {
                          controller.twoFactorAuth.value = value;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Manage Device Authorization'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Configure Emergency Protocols'),
                    ),
                  ],
                ),
                SettingsCard(
                  title: 'Support & Help',
                  children: [
                    ListTile(
                      leading: Icon(Icons.book),
                      title: Text('User Guide & Tutorials'),
                    ),
                    ListTile(
                      leading: Icon(Icons.support),
                      title: Text('Contact Support'),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('System Diagnostics'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Need Help Setting Up?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Our support team is available 24/7 to assist you',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Contact Support'),
                      ),
                      SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text('Help Center'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  SettingsCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  ResponsiveRow({required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth > 600
            ? Row(children: children)
            : Column(children: children);
      },
    );
  }
}
