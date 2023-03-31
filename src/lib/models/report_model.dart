import 'package:json_annotation/json_annotation.dart';

part 'report_model.g.dart';

@JsonSerializable()

class ReportModel {
  String? id;
  String? patientId;
  List<int>? report;
  String? date;

  ReportModel(this.id, this.patientId, this.report, this.date);

  factory ReportModel.fromJson(Map<String, dynamic> json) => _$ReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportModelToJson(this);
}