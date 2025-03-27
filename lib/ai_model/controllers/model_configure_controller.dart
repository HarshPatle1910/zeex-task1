import 'package:get/get.dart';

class ModelConfigController extends GetxController {
  var sensitivity = 'Medium'.obs;
  var triggerTime = 3.0.obs;
  var alertTypes = {'Mobile': true, 'Dashboard': false, 'Email': false}.obs;
}
