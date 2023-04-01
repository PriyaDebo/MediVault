import 'dart:convert';

import 'package:medivault/apis/patient_service.dart';

class PatientBl {
  PatientService patientService = new PatientService();
  
  Future<String> validRegister(String name, String password, String age, String gender) async {
    final res = await patientService.registerPatient(name, password, age, gender);
    if (res.statusCode == 200) {
      final response = jsonDecode(res.body);
      return response.id.toString();
    }

    return "FAIL";
  }

  Future<String> validLogin(String id, String password) async {
    final res = await patientService.loginPatient(id, password);
    if (res.statusCode == 200) {
      return "SUCCESS";
    }

    return "FAIL";
  }
}