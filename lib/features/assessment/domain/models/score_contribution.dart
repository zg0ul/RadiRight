import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_contribution.freezed.dart';
part 'score_contribution.g.dart';

@freezed
class ScoreContribution with _$ScoreContribution {
  const factory ScoreContribution({required String modalityKey, required int score}) = _ScoreContribution;

  factory ScoreContribution.fromJson(Map<String, dynamic> json) => _$ScoreContributionFromJson(json);
}
