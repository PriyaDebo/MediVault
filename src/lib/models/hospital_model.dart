import 'package:json_annotation/json_annotation.dart';

part 'hospital_model.g.dart';

@JsonSerializable()

class HospitalModel {
  String? hospitalId;
  String? hospitalName;
  String? password;
  String? hospitalContact;
  String? hospitalAddress;

  HospitalModel(this.hospitalId, this.hospitalName, this.password, this.hospitalContact, this.hospitalAddress);

  factory HospitalModel.fromJson(Map<String, dynamic> json) => _$HospitalModelFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalModelToJson(this);
}