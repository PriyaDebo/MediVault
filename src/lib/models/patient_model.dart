import 'package:json_annotation/json_annotation.dart';

part 'patient_model.g.dart';

@JsonSerializable()

class PatientModel {
  String? patientId;
  String? patientName;
  String? password;
  String? age;
  String? gender;

  PatientModel(this.patientId, this.patientName, this.password, this.age, this.gender);

  factory PatientModel.fromJson(Map<String, dynamic> json) => _$PatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}