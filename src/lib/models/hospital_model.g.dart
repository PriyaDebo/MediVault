// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) =>
    HospitalModel(
      json['hospitalId'] as String?,
      json['hospitalName'] as String?,
      json['password'] as String?,
      json['hospitalContact'] as String?,
      json['hospitalAddress'] as String?,
    );

Map<String, dynamic> _$HospitalModelToJson(HospitalModel instance) =>
    <String, dynamic>{
      'hospitalId': instance.hospitalId,
      'hospitalName': instance.hospitalName,
      'password': instance.password,
      'hospitalContact': instance.hospitalContact,
      'hospitalAddress': instance.hospitalAddress,
    };
