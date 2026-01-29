import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/appropriateness_level.dart';
import '../enums/radiation_level.dart';

part 'imaging_recommendation.freezed.dart';

@freezed
abstract class ImagingRecommendation with _$ImagingRecommendation {
  const ImagingRecommendation._();

  const factory ImagingRecommendation({
    required String modality,
    required String modalityAr,
    required String procedure,
    required String procedureAr,
    required AppropriatenessLevel appropriateness,
    required RadiationLevel radiation,
    String? comments,
    String? commentsAr,
    int? score,
  }) = _ImagingRecommendation;

  factory ImagingRecommendation.fromJson(Map<String, dynamic> json) {
    return ImagingRecommendation(
      modality: json['modality'] as String,
      modalityAr: json['modalityAr'] as String? ?? json['modality'] as String,
      procedure: json['procedure'] as String,
      procedureAr: json['procedureAr'] as String? ?? json['procedure'] as String,
      appropriateness: json['appropriateness'] is String
          ? AppropriatenessLevel.fromString(json['appropriateness'] as String)
          : json['score'] != null
          ? AppropriatenessLevel.fromScore(json['score'] as int)
          : AppropriatenessLevel.noImagingIndicated,
      radiation: json['radiation'] is String
          ? RadiationLevel.fromString(json['radiation'] as String)
          : RadiationLevel.none,
      comments: json['comments'] as String?,
      commentsAr: json['commentsAr'] as String?,
      score: json['score'] as int?,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'modality': modality,
    'modalityAr': modalityAr,
    'procedure': procedure,
    'procedureAr': procedureAr,
    'appropriateness': appropriateness.name,
    'radiation': radiation.name,
    'comments': comments,
    'commentsAr': commentsAr,
    'score': score,
  };

  String getLocalizedModality(String locale) => locale == 'ar' ? modalityAr : modality;

  String getLocalizedProcedure(String locale) => locale == 'ar' ? procedureAr : procedure;

  String? getLocalizedComments(String locale) => locale == 'ar' ? commentsAr : comments;
}
