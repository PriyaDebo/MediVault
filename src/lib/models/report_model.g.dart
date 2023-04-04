// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportModel _$ReportModelFromJson(Map<String, dynamic> json) => ReportModel(
      json['reportId'] as String?,
      json['patientId'] as String?,
      (json['report'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['date'] as String?,
    );

Map<String, dynamic> _$ReportModelToJson(ReportModel instance) =>
    <String, dynamic>{
      'reportId': instance.reportId,
      'patientId': instance.patientId,
      'report': instance.report,
      'date': instance.date,
    };
