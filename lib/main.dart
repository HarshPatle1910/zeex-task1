import 'package:flutter/material.dart';

import 'home/responsive_scaffold.dart';
import 'members_pages/yash/dashobord1/LEFTSIDEBARNAVIGATION.dart';
import 'members_pages/yash/dashobord1/MIDMAINCONTENT.dart';
import 'members_pages/yash/dashobord1/RIGHTSIDEBAR.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: SecurityDashboard(),
      // home: AIModelControlPage(),
      home: ResponsiveScaffold(),
      // home: DeviceManagementApp(),
    );
  }
}

class SecurityDashboard extends StatelessWidget {
  const SecurityDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          LeftColumn(),
          Expanded(child: MidPage()),
          RightColumn(),
        ],
      ),
    );
  }
}
