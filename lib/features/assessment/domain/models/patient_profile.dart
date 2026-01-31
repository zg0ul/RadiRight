import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient_profile.freezed.dart';

@freezed
class PatientProfile with _$PatientProfile {
  const PatientProfile._();
  const factory PatientProfile({required String ageGroup, required String sex, required String anatomicalLocation}) =
      _PatientProfile;
}

/// Converts PatientProfile to a flat map for assessmentContext (e.g. engine state).
extension PatientProfileX on PatientProfile {
  Map<String, dynamic> toContextMap() => {'ageGroup': ageGroup, 'sex': sex, 'anatomicalLocation': anatomicalLocation};
}
