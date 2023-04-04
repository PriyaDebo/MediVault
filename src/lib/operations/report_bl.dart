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

  Future<List<int>> getAnalysis(String patientId) async {
    final res = await reportService.readAnalysis(patientId);
    print("Status Code: ");
    print(res.statusCode);
    if (res.statusCode == 200) {
      // final responseBody = jsonDecode(res.body);
      print(res.body);
      // final analysis = utf8.encode(res.body);
      final List<dynamic> responseJson = json.decode(res.body);
      final List<int> analysis = List.from(responseJson.map((e) => e as int));
      print(analysis);
      return analysis;
    }

    return <int>[];
  }
}