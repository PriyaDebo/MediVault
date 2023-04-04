import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medivault/models/report_model.dart';

class ReportService {

  final uriLink = "http://192.168.129.111:5000";
  final header = <String, String>{'Content-Type': 'application/json; charset=UTF-8',};

  Future<http.Response> uploadReport(String patientId, List<int> report, String date) async {
    var reportRequest = new ReportModel(null, patientId, report, date);
    final uri = uriLink + "/add-report";
    final response = await http.put(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(reportRequest.toJson()),
    );

    return response;
  }

  Future<http.Response> readAnalysis(String patientId) async {
    final uri = uriLink + "/read-analysis?patientId=$patientId";
    final response = await http.get(
      Uri.parse(uri),
      headers: header,
    ).timeout(Duration(seconds: 10000000), onTimeout: () {
      throw TimeoutException('The request timed out.');
    });

    print(response.headers);
    print(response.statusCode);
    return response;
  }
}
