import 'package:get/get.dart';

class ModelsController extends GetxController {
  final modelsList =
      [
        {
          'model': 'YOLOv8 - Intrusion Detection',
          'purpose': 'Detects unauthorized entry',
          'devices': 'CCTV, Sensors',
          'status': 'Active',
        },
        {
          'model': 'YOLOv8 - Weapon Detection',
          'purpose': 'Detects weapons in real time',
          'devices': 'CCTV',
          'status': 'Inactive',
        },
        {
          'model': 'YOLOv8 - Mask Detection',
          'purpose': 'Detects masks on people',
          'devices': 'CCTV',
          'status': 'Active',
        },
      ].obs;
}
