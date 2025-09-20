import 'package:json_annotation/json_annotation.dart';

part 'areas_model.g.dart';

@JsonSerializable()
class AreasModel {
  int? id;
  String? name;

  AreasModel();

  factory AreasModel.fromJson(Map<String, dynamic> json) =>
      _$AreasModelFromJson(json);

  Map<String, dynamic> toJson() => _$AreasModelToJson(this);
}
