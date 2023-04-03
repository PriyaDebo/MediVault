import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medivault/models/login_model.dart';
import 'package:medivault/models/patient_model.dart';


class PatientService {

  final uriLink = "http://10.31.13.81:5000";
  final header = <String, String>{'Content-Type': 'application/json; charset=UTF-8',};

  Future<http.Response> registerPatient(String name, String password, String age, String gender) async{
    var hospital = new PatientModel(null, name, password, age, gender);
    final uri = uriLink + "/store-patient-details";
    final response = await http.put(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(hospital.toJson()),
    );

    return response;
  }

  Future<http.Response> loginPatient(String id, String password) async{
    var login = new LoginModel('P', id, password);
    final uri = uriLink + "/login";
    final response = await http.post(
      Uri.parse(uri),
      headers: header,
      body: jsonEncode(login.toJson()),
    );

    print (response);
    return response;
  }
}