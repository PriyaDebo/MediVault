// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HospitalModel _$HospitalModelFromJson(Map<String, dynamic> json) =>
    HospitalModel(
      json['id'] as String?,
      json['name'] as String?,
      json['password'] as String?,
      json['contact'] as String?,
    );

Map<String, dynamic> _$HospitalModelToJson(HospitalModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'contact': instance.contact,
    };
