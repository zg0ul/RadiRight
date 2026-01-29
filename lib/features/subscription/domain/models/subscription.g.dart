// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      tier: $enumDecode(_$SubscriptionTierEnumMap, json['tier']),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      isTrialUsed: json['isTrialUsed'] as bool? ?? false,
      trialEndDate: json['trialEndDate'] == null
          ? null
          : DateTime.parse(json['trialEndDate'] as String),
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'tier': _$SubscriptionTierEnumMap[instance.tier]!,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'isTrialUsed': instance.isTrialUsed,
      'trialEndDate': instance.trialEndDate?.toIso8601String(),
    };

const _$SubscriptionTierEnumMap = {
  SubscriptionTier.none: 'none',
  SubscriptionTier.trial: 'trial',
  SubscriptionTier.monthly: 'monthly',
  SubscriptionTier.yearly: 'yearly',
};
