import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medivault/models/hospital_model.dart';
import 'package:medivault/models/login_model.dart';


class HospitalService {

  final uriLink = "";
  final header = <String, String>{'Content-Type': 'application/json; charset=UTF-8',};

  Future<http.Response> registerHospital(String name, String password, String contact) async{
    var hospital = new HospitalModel(null, name, password, contact, "");
    final uri = uriLink + "/store-hospital-details";
    final response = await http.put(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(hospital.toJson()),
    );

    return response;
  }

  Future<http.Response> loginHospital(String id, String password) async{
    var login = new LoginModel('H', id, password);
    final uri = uriLink + "/login";
    final response = await http.post(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(login.toJson()),
    );

    return response;
  }
}