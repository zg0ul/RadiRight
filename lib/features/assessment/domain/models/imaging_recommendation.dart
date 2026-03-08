import 'package:freezed_annotation/freezed_annotation.dart';
part 'imaging_recommendation.freezed.dart';

@freezed
abstract class ImagingRecommendation with _$ImagingRecommendation {
  const ImagingRecommendation._();

  const factory ImagingRecommendation({
    required String modality,
    required String modalityAr,
    required String procedure,
    required String procedureAr,
    String? comments,
    String? commentsAr,
    /// Priority level for the recommendation.
    /// 1 = primary/best choice (Option 1)
    /// 2 = acceptable alternative (Option 2)
    /// Higher numbers = lower priority
    @Default(1) int priority,
  }) = _ImagingRecommendation;

  factory ImagingRecommendation.fromJson(Map<String, dynamic> json) {
    return ImagingRecommendation(
      modality: json['modality'] as String,
      modalityAr: json['modalityAr'] as String? ?? json['modality'] as String,
      procedure: json['procedure'] as String,
      procedureAr: json['procedureAr'] as String? ?? json['procedure'] as String,
      comments: json['comments'] as String?,
      commentsAr: json['commentsAr'] as String?,
      priority: json['priority'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'modality': modality,
    'modalityAr': modalityAr,
    'procedure': procedure,
    'procedureAr': procedureAr,
    'comments': comments,
    'commentsAr': commentsAr,
    'priority': priority,
  };

  String getLocalizedModality(String locale) => locale == 'ar' ? modalityAr : modality;

  String getLocalizedProcedure(String locale) => locale == 'ar' ? procedureAr : procedure;

  String? getLocalizedComments(String locale) => locale == 'ar' ? commentsAr : comments;
}
