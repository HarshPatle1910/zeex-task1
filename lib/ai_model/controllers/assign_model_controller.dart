import 'package:get/get.dart';

class AssignModelController extends GetxController {
  var selectedDevice = 'CCTV - Main Entrance'.obs;
  var selectedModel = 'YOLOv8 - Weapon Detection'.obs;
  var sensitivity = 'Medium'.obs;

  void resetFields() {
    selectedDevice.value = 'CCTV - Main Entrance';
    selectedModel.value = 'YOLOv8 - Weapon Detection';
    sensitivity.value = 'Medium';
  }
}
