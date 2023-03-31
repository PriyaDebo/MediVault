import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medivault/models/report_model.dart';

class ReportService {
  final uriLink = "";
  final header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<http.Response> uploadReport(
      String patientId, List<int> report, String date) async {
    var reportRequest = new ReportModel(null, patientId, report, date);
    final uri = uriLink + "/add-report";
    final response = await http.post(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(reportRequest.toJson()),
    );

    return response;
  }
}
