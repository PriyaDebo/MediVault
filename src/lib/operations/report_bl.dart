import 'dart:convert';

import 'package:medivault/apis/report_service.dart';

class ReportBl {
  ReportService reportService = new ReportService();

  Future<String> reportUpload(String patientId, List<int> report, String date) async {
    final res = await reportService.uploadReport(patientId, report, date);
    if (res.statusCode == 200) {
      return "SUCCESS";
    }

    return "FAIL";
  }
}