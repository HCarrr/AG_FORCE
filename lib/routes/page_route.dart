import 'package:agforce_kehadiran/pages/qr_attendance/qr_attendance_page.dart';
import 'package:agforce_kehadiran/routes/route_name.dart';
import 'package:get/get.dart';

class PagesRoute{
  static final pages = [
    GetPage(name: RouteName.qrAttendance, page: () => QRPage())
  ];
}