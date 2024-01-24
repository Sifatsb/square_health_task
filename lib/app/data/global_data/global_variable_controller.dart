import 'package:get/get.dart';

class GlobalRxVariableController extends GetxController {
  final id = Rxn<int>();
  final userId = Rxn<int>();
  final token = Rxn<String>();
}
