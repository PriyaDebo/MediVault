import 'package:json_annotation/json_annotation.dart';

part 'hospital_model.g.dart';

@JsonSerializable()

class HospitalModel {
  String? id;
  String? name;
  String? password;
  String? contact;

  HospitalModel(this.id, this.name, this.password, this.contact);

  factory HospitalModel.fromJson(Map<String, dynamic> json) => _$HospitalModelFromJson(json);

  Map<String, dynamic> toJson() => _$HospitalModelToJson(this);
}