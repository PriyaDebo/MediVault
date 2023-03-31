import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()

class LoginModel {
  String? type;
  String? id;
  String? password;

  LoginModel(this.type, this.id, this.password);

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}