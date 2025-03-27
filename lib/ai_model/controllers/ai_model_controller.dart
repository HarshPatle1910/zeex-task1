import 'package:get/get.dart';

class AIModelController extends GetxController {
  // Reactive variables
  var selectedDevice = 'CCTV - Main Entrance'.obs;
  var selectedModel = 'YOLOv8 - Weapon Detection'.obs;
  var sensitivity = 'Medium'.obs;
  var triggerTime = 3.0.obs;
  var alertTypes = {'Mobile': false, 'Dashboard': false, 'Email': false}.obs;

  // Methods for toggling alert types
  void toggleAlertType(String type) {
    alertTypes[type] = !alertTypes[type]!;
  }
}
