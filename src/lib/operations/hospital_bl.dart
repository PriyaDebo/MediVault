import 'dart:convert';

import 'package:medivault/apis/hospital_service.dart';

class HospitalBl {
  HospitalService hospitalService = new HospitalService();

  Future<String> validRegister(String name, String password, String contact) async {
    final res = await hospitalService.registerHospital(name, password, contact);
    if (res.statusCode == 200) {
      final response = jsonDecode(res.body);
      return response.id.toString();
    }

    return "FAIL";
  }

  Future<String> validLogin(String id, String password) async {
    final res = await hospitalService.loginHospital(id, password);
    if (res.statusCode == 200) {
      return "SUCCESS";
    }

    return "FAIL";
  }
}
