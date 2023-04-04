// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      json['patientId'] as String?,
      json['patientName'] as String?,
      json['password'] as String?,
      json['age'] as String?,
      json['gender'] as String?,
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'patientName': instance.patientName,
      'password': instance.password,
      'age': instance.age,
      'gender': instance.gender,
    };
