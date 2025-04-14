import 'package:flutter/material.dart';
import 'package:task1/home/responsive_scaffold.dart';

Future<void> main() async {
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

      // home: MJPEGViewerPage(),
      home: ResponsiveScaffold(),
      // home: LiveFeedCard(
      //   cameraTitle: "Main Entrance",
      //   streamUrl: 'http://3.110.138.205:5000/video_feed',
      // ),
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString("access_token");
//
//   runApp(MyApp(initialRoute: token != null ? "/dashboard" : "/register"));
// }
//
// class MyApp extends StatelessWidget {
//   final String initialRoute;
//   MyApp({required this.initialRoute});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Zeex AI',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       initialRoute: initialRoute,
//       routes: {
//         "/login": (context) => LoginPage(),
//         "/register": (context) => RegisterPage(),
//         "/dashboard": (context) => ResponsiveScaffold(),
//       },
//     );
//   }
// }
