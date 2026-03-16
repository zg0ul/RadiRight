// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'RadiRight';

  @override
  String get acrAppropriatenessCriteria => 'ACR Appropriateness Criteria';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get name => 'Name';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signIn => 'Sign In';

  @override
  String get logout => 'Logout';

  @override
  String get logoutConfirmation => 'Are you sure you want to logout?';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get home => 'Home';

  @override
  String get history => 'History';

  @override
  String get settings => 'Settings';

  @override
  String get profile => 'Profile';

  @override
  String get startAssessment => 'Start Assessment';

  @override
  String get selectPanel => 'Select Clinical Panel';

  @override
  String get selectPanelSubtitle => 'Choose the clinical specialty relevant to your patient\'s case.';

  @override
  String get selectTopic => 'Select Topic';

  @override
  String get patientDemographics => 'Patient Demographics';

  @override
  String get patientDemographicsSubtitle => 'Provide information about your patient';

  @override
  String get ageGroup => 'Age Group';

  @override
  String get sex => 'Sex';

  @override
  String get anatomicalLocation => 'Anatomical Location';

  @override
  String get ageGroup0to18 => '0-18 years';

  @override
  String get ageGroup19to40 => '19-40 years';

  @override
  String get ageGroup41to65 => '41-65 years';

  @override
  String get ageGroup65Plus => '65+ years';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get upperExtremity => 'Upper extremity';

  @override
  String get lowerExtremity => 'Lower extremity';

  @override
  String get spine => 'Spine';

  @override
  String get pelvis => 'Pelvis';

  @override
  String get shoulder => 'Shoulder';

  @override
  String get knee => 'Knee';

  @override
  String get hip => 'Hip';

  @override
  String get ankle => 'Ankle';

  @override
  String get wrist => 'Wrist';

  @override
  String get continueButton => 'Continue';

  @override
  String get preparingAssessment => 'Preparing Assessment...';

  @override
  String get preparingAssessmentSubtitle => 'Generating clinical questions based on ACR guidelines';

  @override
  String get analyzingResponses => 'Analyzing Your Responses...';

  @override
  String get analyzingResponsesSubtitle => 'Matching with appropriate imaging recommendations';

  @override
  String get acrRecommendation => 'ACR Recommendation';

  @override
  String get acrRecommendationSubtitle => 'Based on evidence-based guidelines and your clinical scenario';

  @override
  String get usuallyAppropriateVerdict => 'Usually Appropriate';

  @override
  String get usuallyAppropriateVerdictDesc => 'This imaging study is usually appropriate for this clinical scenario';

  @override
  String get appropriatenessScore => 'Appropriateness Score';

  @override
  String get guidelineCode => 'Guideline Code';

  @override
  String get clinicalScenario => 'Clinical Scenario';

  @override
  String get recommendedImagingStudy => 'Recommended Imaging Study';

  @override
  String get evidenceSummary => 'Evidence Summary';

  @override
  String get alternativeImagingOptions => 'Alternative Imaging Options';

  @override
  String get mayBeAppropriate => 'May Be Appropriate';

  @override
  String get usuallyNotAppropriate => 'Usually Not Appropriate';

  @override
  String get clinicalJudgment => 'Clinical Judgment';

  @override
  String get clinicalJudgmentDisclaimer =>
      'These recommendations are based on ACR Appropriateness Criteria® and should be used in conjunction with clinical judgment, considering individual patient factors, institutional protocols, and the specific clinical context.';

  @override
  String get searchTopics => 'Search topics...';

  @override
  String get question => 'Question';

  @override
  String questionProgress(int current, int total) {
    return 'Question $current of $total';
  }

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get viewResults => 'View Results';

  @override
  String get results => 'Results';

  @override
  String get assessmentResults => 'Assessment Results';

  @override
  String get imagingRecommendations => 'Imaging Recommendations';

  @override
  String get noRecommendations => 'No imaging recommendations';

  @override
  String get procedure => 'Procedure';

  @override
  String get appropriateness => 'Appropriateness';

  @override
  String get radiation => 'Radiation';

  @override
  String get comments => 'Comments';

  @override
  String get usuallyAppropriate => 'Usually Appropriate';

  @override
  String get noImagingIndicated => 'No Imaging Indicated';

  @override
  String get radiationNone => 'None';

  @override
  String get radiationLow => 'Low';

  @override
  String get radiationMedium => 'Medium';

  @override
  String get radiationHigh => 'High';

  @override
  String get subscription => 'Subscription';

  @override
  String get subscriptionStatus => 'Subscription Status';

  @override
  String get trial => 'Trial';

  @override
  String get trialActive => 'Trial Active';

  @override
  String get trialExpired => 'Trial Expired';

  @override
  String get monthly => 'Monthly';

  @override
  String get yearly => 'Yearly';

  @override
  String daysRemaining(int days) {
    return '$days days remaining';
  }

  @override
  String get subscriptionExpired => 'Your subscription has expired';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get contactForSubscription => 'Contact us to subscribe';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactPhone => 'Phone';

  @override
  String get copyToClipboard => 'Copy to clipboard';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get noHistory => 'No assessment history';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get clearHistoryConfirmation => 'Are you sure you want to clear all history?';

  @override
  String get historyDetailTitle => 'Assessment details';

  @override
  String get yourAnswers => 'Your answers';

  @override
  String get exitProgressWarning => 'Are you sure you want to exit? Your progress will be lost.';

  @override
  String get assessmentCompleted => 'Assessment completed';

  @override
  String get viewDetails => 'View Details';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get theme => 'Theme';

  @override
  String get lightTheme => 'Light';

  @override
  String get darkTheme => 'Dark';

  @override
  String get systemTheme => 'System';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get loading => 'Loading...';

  @override
  String get noConnection => 'No internet connection';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get tryAgain => 'Try again';

  @override
  String get musculoskeletal => 'Musculoskeletal';

  @override
  String get musculoskeletalDescription => 'ACR Appropriateness Criteria for musculoskeletal imaging';

  @override
  String get acuteElbowForearmPain => 'Acute Elbow or Forearm Pain';

  @override
  String get acuteHandWristTrauma => 'Acute Hand and Wrist Trauma';

  @override
  String get acuteHipPain => 'Acute Hip Pain';

  @override
  String get acuteShoulderPain => 'Acute Shoulder Pain';

  @override
  String get acuteSpinalTraumaCervical => 'Acute Spinal Trauma - Cervical Spine';

  @override
  String get acuteSpinalTraumaThoracicLumbar => 'Acute Spinal Trauma - Thoracic/Lumbar Spine';

  @override
  String get acuteTraumaAnkle => 'Acute Trauma to the Ankle';

  @override
  String get acuteTraumaFoot => 'Acute Trauma to the Foot';

  @override
  String get acuteTraumaKnee => 'Acute Trauma to the Knee';

  @override
  String get chronicAnklePain => 'Chronic Ankle Pain';

  @override
  String get chronicElbowPain => 'Chronic Elbow Pain';

  @override
  String get chronicExtremityJointPainInflammatory => 'Chronic Extremity Joint Pain - Inflammatory Arthritis';

  @override
  String get chronicFootPain => 'Chronic Foot Pain';

  @override
  String get chronicHandWristPain => 'Chronic Hand and Wrist Pain';

  @override
  String get chronicHipPain => 'Chronic Hip Pain';

  @override
  String get chronicKneePain => 'Chronic Knee Pain';

  @override
  String get chronicShoulderPain => 'Chronic Shoulder Pain';

  @override
  String get imagingAfterShoulderArthroplasty => 'Imaging After Shoulder Arthroplasty';

  @override
  String get imagingAfterTotalHipArthroplasty => 'Imaging After Total Hip Arthroplasty';

  @override
  String get imagingAfterTotalKneeArthroplasty => 'Imaging After Total Knee Arthroplasty';

  @override
  String get inflammatoryBackPainAxial => 'Inflammatory Back Pain - Axial Spondyloarthropathy';

  @override
  String get malignantPrimaryMskTumor => 'Malignant Primary MSK Tumor - Staging & Surveillance';

  @override
  String get vertebralCompressionFractures => 'Management of Vertebral Compression Fractures';

  @override
  String get osteonecrosis => 'Osteonecrosis';

  @override
  String get osteoporosisBoneDensity => 'Osteoporosis and Bone Mineral Density';

  @override
  String get stressFracture => 'Stress (Fatigue/Insufficiency) Fracture';

  @override
  String get suspectedOsteomyelitis => 'Suspected Osteomyelitis/Septic Arthritis/Soft Tissue Infection';

  @override
  String get suspectedPrimaryBoneTumors => 'Suspected Primary Bone Tumors';

  @override
  String get questions => 'questions';

  @override
  String get questionSingular => 'question';

  @override
  String questionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'questions', one: 'question');
    return '$count $_temp0';
  }

  @override
  String get hapticFeedback => 'Haptic Feedback';

  @override
  String get hapticFeedbackDescription => 'Enable tactile feedback for interactions';

  @override
  String get homeTagline => 'Evidence synthesized from 10+ major international guidelines';

  @override
  String homeDescriptionCard(int guidelinesCount) {
    return 'RadiRight guides healthcare professionals to choose the most appropriate imaging based on clinical scenarios and our evidence-based recommendations synthesized from over $guidelinesCount international guidelines.';
  }

  @override
  String get homeForMedicalProfessionals => 'For Medical Professionals';

  @override
  String get homeBuiltOnEvidence => 'Built on Evidence';

  @override
  String homePoweredByGuidelines(int count) {
    return 'Powered by $count+ International Guidelines';
  }

  @override
  String get homeGuidelinesDescription =>
      'Our recommendations are carefully synthesized from the world\'s most trusted radiology and medical imaging authorities, ensuring you get reliable, up-to-date guidance.';

  @override
  String get homeEvidenceBasedRecommendations => 'Evidence-Based Recommendations';

  @override
  String get homeEvidenceBasedRecommendationsDesc =>
      'Every imaging recommendation in RadiRight is derived from a thorough review of guidelines published by organizations like the ACR Appropriateness Criteria, iRefer (Royal College of Radiologists), CAR, WHO, and more. When guidelines agree, we present the consensus. When they differ, we highlight the options and context.';

  @override
  String get homeAiClinicalReasoning => 'AI-Powered Clinical Reasoning';

  @override
  String get homeAiClinicalReasoningDesc =>
      'RadiRight integrates AI to provide contextual explanations for every recommendation — explaining why a modality is appropriate, when alternatives should be considered, and what the clinical evidence says. When no guideline exists, AI steps in with evidence-based reasoning to guide your decision.';

  @override
  String get homeHowAiEnhances => 'How AI Enhances Your Assessment';

  @override
  String get homeAiClinicalExplanations => 'Clinical Explanations';

  @override
  String get homeAiClinicalExplanationsDesc =>
      'Understand the reasoning behind each recommendation with plain-language explanations grounded in radiology literature.';

  @override
  String get homeAiGapCoverage => 'Gap Coverage';

  @override
  String get homeAiGapCoverageDesc =>
      'When guidelines don\'t cover a specific scenario, AI provides evidence-based opinions while clearly noting the absence of formal guidance.';

  @override
  String get homeAiEducationalFeedback => 'Educational Feedback';

  @override
  String get homeAiEducationalFeedbackDesc =>
      'Learn from every assessment — whether your choice was correct, a 2nd choice, or not indicated, AI explains what to consider next time.';

  @override
  String get homeAiDisclaimer =>
      'AI explanations are designed to support — never replace — clinical judgment. All outputs include appropriate disclaimers.';

  @override
  String get homeFeatureEvidenceBased => 'Evidence\nBased';

  @override
  String get homeFeatureAcrCriteria => 'ACR\nCriteria';

  @override
  String get homeFeatureQuickResults => 'Quick\nResults';

  @override
  String get homeFooterAcrBased => 'Based on ACR Appropriateness Criteria®';

  @override
  String get recommendationFound => 'Recommendation Found';

  @override
  String get resultBasedOnAcr => 'Based on ACR Appropriateness Criteria';

  @override
  String get acr => 'ACR';

  @override
  String get whyThisRecommendation => 'Why this recommendation?';

  @override
  String radiationLevel(String level) {
    return 'Radiation: $level';
  }

  @override
  String get selectImagingModality => 'Select Imaging Modality';

  @override
  String get chooseImagingType => 'Choose the imaging type you would recommend';

  @override
  String get selectClinicalArea => 'Select Clinical Area';

  @override
  String get chooseBodySystem => 'Choose the body system to evaluate';

  @override
  String get selectClinicalScenario => 'Select Clinical Scenario';

  @override
  String get chooseRelevantPresentation => 'Choose the relevant clinical presentation';

  @override
  String stepOf(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get backToTopics => 'Back to Topics';

  @override
  String get modalityUltrasound => 'Ultrasound';

  @override
  String get modalityMRI => 'MRI';

  @override
  String get modalityCTScan => 'CT Scan';

  @override
  String get modalityNuclearMedicine => 'Nuclear Medicine';

  @override
  String get modalityPETImaging => 'PET Imaging';

  @override
  String get modalityAngiography => 'Angiography';

  @override
  String get modalityMammography => 'Mammography';

  @override
  String get modalityArthrography => 'Arthrography';

  @override
  String get modalityXRay => 'X-ray';

  @override
  String get yourSelection => 'Your Selection';

  @override
  String get notIndicated => 'Not Indicated';

  @override
  String get indicated => 'Indicated';

  @override
  String get recommendedOptions => 'Recommended Option(s)';

  @override
  String get primaryRecommendation => 'Primary Recommendation';

  @override
  String get alternativeOption => 'Alternative Option';

  @override
  String get trueImagingIndicated => 'TRUE - Imaging Indicated';

  @override
  String get falseImagingNotIndicated => 'FALSE - Imaging NOT Indicated';

  @override
  String get mayBeAppropriateTitle => 'May Be Appropriate';

  @override
  String get noCurrentGuidelines => 'No Current Guidelines Available';

  @override
  String get aiClinicalAssessment => 'AI Clinical Assessment';

  @override
  String get scenarioNotCoveredByGuidelines => 'This specific scenario is not covered by current guidelines.';

  @override
  String get aiWouldAssess => 'The AI would assess:';

  @override
  String get aiAssessItem1 => 'Ask about pain severity and duration';

  @override
  String get aiAssessItem2 => 'Assess clinical urgency';

  @override
  String get aiAssessItem3 => 'Provide opinion on conservative management vs imaging';

  @override
  String get aiAssessItem4 => 'Explain clinical reasoning';

  @override
  String get finalDecisionDisclaimer => 'Final decision depends on physician\'s clinical judgment';

  @override
  String get startNewAssessment => 'Start New Assessment';

  @override
  String get aiExplanation => 'AI Explanation';

  @override
  String get aiExplanationPlaceholder =>
      'AI explanation will be generated here: \"Explain the appropriate imaging for this clinical scenario\"';

  @override
  String notRecommendedForScenario(String modality) {
    return '$modality is not the recommended imaging for this scenario.';
  }

  @override
  String get yourChoiceIsIndicated =>
      'Your selected imaging study is the recommended choice for this clinical scenario.';

  @override
  String get yourChoiceMayBeAppropriate =>
      'Your selected imaging study may be appropriate, but other options might be preferred.';

  @override
  String get yourChoiceNotIndicated => 'Your selected imaging study is not recommended for this clinical scenario.';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String topicsCount(int count) {
    return '$count Topics';
  }

  @override
  String get historyDetailAt => 'at';
}
