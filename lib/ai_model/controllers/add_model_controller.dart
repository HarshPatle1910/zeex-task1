// Controller for State Management
import 'package:get/get.dart';

class AddModelController extends GetxController {
  var modelName = ''.obs;
  var modelType = 'Classification'.obs;
  var cctvSelected = false.obs;
  var motionSensorsSelected = false.obs;
  var thermalCamerasSelected = false.obs;

  void toggleCheckbox(String type) {
    switch (type) {
      case 'CCTV':
        cctvSelected.value = !cctvSelected.value;
        break;
      case 'Motion':
        motionSensorsSelected.value = !motionSensorsSelected.value;
        break;
      case 'Thermal':
        thermalCamerasSelected.value = !thermalCamerasSelected.value;
        break;
    }
  }
}
