// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      json['id'] as String?,
      json['name'] as String?,
      json['password'] as String?,
      json['age'] as String?,
      json['gender'] as String?,
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'password': instance.password,
      'age': instance.age,
      'gender': instance.gender,
    };
