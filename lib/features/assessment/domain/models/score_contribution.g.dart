// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreContributionImpl _$$ScoreContributionImplFromJson(
  Map<String, dynamic> json,
) => _$ScoreContributionImpl(
  modalityKey: json['modalityKey'] as String,
  score: (json['score'] as num).toInt(),
);

Map<String, dynamic> _$$ScoreContributionImplToJson(
  _$ScoreContributionImpl instance,
) => <String, dynamic>{
  'modalityKey': instance.modalityKey,
  'score': instance.score,
};
