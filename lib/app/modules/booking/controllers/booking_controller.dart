import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingController extends GetxController {
  //TODO: Implement BookingController

  final count = 0.obs;
  final room = ''.obs;
  final selectedDate = ''.obs;
  final tmpdate = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      selectedDate.value = args.value.toString();
      tmpdate.value = DateFormat('EEEE, dd MMMM yyyy').format(args.value);
    }
  }
}
