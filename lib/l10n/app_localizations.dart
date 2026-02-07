import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// The name of the application
  ///
  /// In en, this message translates to:
  /// **'RadiRight'**
  String get appName;

  /// No description provided for @acrAppropriatenessCriteria.
  ///
  /// In en, this message translates to:
  /// **'ACR Appropriateness Criteria'**
  String get acrAppropriatenessCriteria;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get logoutConfirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @startAssessment.
  ///
  /// In en, this message translates to:
  /// **'Start Assessment'**
  String get startAssessment;

  /// No description provided for @selectPanel.
  ///
  /// In en, this message translates to:
  /// **'Select Clinical Panel'**
  String get selectPanel;

  /// No description provided for @selectPanelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the clinical specialty relevant to your patient\'s case.'**
  String get selectPanelSubtitle;

  /// No description provided for @selectTopic.
  ///
  /// In en, this message translates to:
  /// **'Select Topic'**
  String get selectTopic;

  /// No description provided for @patientDemographics.
  ///
  /// In en, this message translates to:
  /// **'Patient Demographics'**
  String get patientDemographics;

  /// No description provided for @patientDemographicsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Provide information about your patient'**
  String get patientDemographicsSubtitle;

  /// No description provided for @ageGroup.
  ///
  /// In en, this message translates to:
  /// **'Age Group'**
  String get ageGroup;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @anatomicalLocation.
  ///
  /// In en, this message translates to:
  /// **'Anatomical Location'**
  String get anatomicalLocation;

  /// No description provided for @ageGroup0to18.
  ///
  /// In en, this message translates to:
  /// **'0-18 years'**
  String get ageGroup0to18;

  /// No description provided for @ageGroup19to40.
  ///
  /// In en, this message translates to:
  /// **'19-40 years'**
  String get ageGroup19to40;

  /// No description provided for @ageGroup41to65.
  ///
  /// In en, this message translates to:
  /// **'41-65 years'**
  String get ageGroup41to65;

  /// No description provided for @ageGroup65Plus.
  ///
  /// In en, this message translates to:
  /// **'65+ years'**
  String get ageGroup65Plus;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @upperExtremity.
  ///
  /// In en, this message translates to:
  /// **'Upper extremity'**
  String get upperExtremity;

  /// No description provided for @lowerExtremity.
  ///
  /// In en, this message translates to:
  /// **'Lower extremity'**
  String get lowerExtremity;

  /// No description provided for @spine.
  ///
  /// In en, this message translates to:
  /// **'Spine'**
  String get spine;

  /// No description provided for @pelvis.
  ///
  /// In en, this message translates to:
  /// **'Pelvis'**
  String get pelvis;

  /// No description provided for @shoulder.
  ///
  /// In en, this message translates to:
  /// **'Shoulder'**
  String get shoulder;

  /// No description provided for @knee.
  ///
  /// In en, this message translates to:
  /// **'Knee'**
  String get knee;

  /// No description provided for @hip.
  ///
  /// In en, this message translates to:
  /// **'Hip'**
  String get hip;

  /// No description provided for @ankle.
  ///
  /// In en, this message translates to:
  /// **'Ankle'**
  String get ankle;

  /// No description provided for @wrist.
  ///
  /// In en, this message translates to:
  /// **'Wrist'**
  String get wrist;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @preparingAssessment.
  ///
  /// In en, this message translates to:
  /// **'Preparing Assessment...'**
  String get preparingAssessment;

  /// No description provided for @preparingAssessmentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Generating clinical questions based on ACR guidelines'**
  String get preparingAssessmentSubtitle;

  /// No description provided for @analyzingResponses.
  ///
  /// In en, this message translates to:
  /// **'Analyzing Your Responses...'**
  String get analyzingResponses;

  /// No description provided for @analyzingResponsesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Matching with appropriate imaging recommendations'**
  String get analyzingResponsesSubtitle;

  /// No description provided for @acrRecommendation.
  ///
  /// In en, this message translates to:
  /// **'ACR Recommendation'**
  String get acrRecommendation;

  /// No description provided for @acrRecommendationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Based on evidence-based guidelines and your clinical scenario'**
  String get acrRecommendationSubtitle;

  /// No description provided for @usuallyAppropriateVerdict.
  ///
  /// In en, this message translates to:
  /// **'Usually Appropriate'**
  String get usuallyAppropriateVerdict;

  /// No description provided for @usuallyAppropriateVerdictDesc.
  ///
  /// In en, this message translates to:
  /// **'This imaging study is usually appropriate for this clinical scenario'**
  String get usuallyAppropriateVerdictDesc;

  /// No description provided for @appropriatenessScore.
  ///
  /// In en, this message translates to:
  /// **'Appropriateness Score'**
  String get appropriatenessScore;

  /// No description provided for @guidelineCode.
  ///
  /// In en, this message translates to:
  /// **'Guideline Code'**
  String get guidelineCode;

  /// No description provided for @clinicalScenario.
  ///
  /// In en, this message translates to:
  /// **'Clinical Scenario'**
  String get clinicalScenario;

  /// No description provided for @recommendedImagingStudy.
  ///
  /// In en, this message translates to:
  /// **'Recommended Imaging Study'**
  String get recommendedImagingStudy;

  /// No description provided for @evidenceSummary.
  ///
  /// In en, this message translates to:
  /// **'Evidence Summary'**
  String get evidenceSummary;

  /// No description provided for @alternativeImagingOptions.
  ///
  /// In en, this message translates to:
  /// **'Alternative Imaging Options'**
  String get alternativeImagingOptions;

  /// No description provided for @mayBeAppropriate.
  ///
  /// In en, this message translates to:
  /// **'May Be Appropriate'**
  String get mayBeAppropriate;

  /// No description provided for @usuallyNotAppropriate.
  ///
  /// In en, this message translates to:
  /// **'Usually Not Appropriate'**
  String get usuallyNotAppropriate;

  /// No description provided for @clinicalJudgment.
  ///
  /// In en, this message translates to:
  /// **'Clinical Judgment'**
  String get clinicalJudgment;

  /// No description provided for @clinicalJudgmentDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'These recommendations are based on ACR Appropriateness Criteria® and should be used in conjunction with clinical judgment, considering individual patient factors, institutional protocols, and the specific clinical context.'**
  String get clinicalJudgmentDisclaimer;

  /// No description provided for @searchTopics.
  ///
  /// In en, this message translates to:
  /// **'Search topics...'**
  String get searchTopics;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// No description provided for @questionProgress.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String questionProgress(int current, int total);

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @viewResults.
  ///
  /// In en, this message translates to:
  /// **'View Results'**
  String get viewResults;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// No description provided for @assessmentResults.
  ///
  /// In en, this message translates to:
  /// **'Assessment Results'**
  String get assessmentResults;

  /// No description provided for @imagingRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Imaging Recommendations'**
  String get imagingRecommendations;

  /// No description provided for @noRecommendations.
  ///
  /// In en, this message translates to:
  /// **'No imaging recommendations'**
  String get noRecommendations;

  /// No description provided for @procedure.
  ///
  /// In en, this message translates to:
  /// **'Procedure'**
  String get procedure;

  /// No description provided for @appropriateness.
  ///
  /// In en, this message translates to:
  /// **'Appropriateness'**
  String get appropriateness;

  /// No description provided for @radiation.
  ///
  /// In en, this message translates to:
  /// **'Radiation'**
  String get radiation;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get comments;

  /// No description provided for @usuallyAppropriate.
  ///
  /// In en, this message translates to:
  /// **'Usually Appropriate'**
  String get usuallyAppropriate;

  /// No description provided for @noImagingIndicated.
  ///
  /// In en, this message translates to:
  /// **'No Imaging Indicated'**
  String get noImagingIndicated;

  /// No description provided for @radiationNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get radiationNone;

  /// No description provided for @radiationLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get radiationLow;

  /// No description provided for @radiationMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get radiationMedium;

  /// No description provided for @radiationHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get radiationHigh;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// No description provided for @subscriptionStatus.
  ///
  /// In en, this message translates to:
  /// **'Subscription Status'**
  String get subscriptionStatus;

  /// No description provided for @trial.
  ///
  /// In en, this message translates to:
  /// **'Trial'**
  String get trial;

  /// No description provided for @trialActive.
  ///
  /// In en, this message translates to:
  /// **'Trial Active'**
  String get trialActive;

  /// No description provided for @trialExpired.
  ///
  /// In en, this message translates to:
  /// **'Trial Expired'**
  String get trialExpired;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @yearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get yearly;

  /// No description provided for @daysRemaining.
  ///
  /// In en, this message translates to:
  /// **'{days} days remaining'**
  String daysRemaining(int days);

  /// No description provided for @subscriptionExpired.
  ///
  /// In en, this message translates to:
  /// **'Your subscription has expired'**
  String get subscriptionExpired;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @contactForSubscription.
  ///
  /// In en, this message translates to:
  /// **'Contact us to subscribe'**
  String get contactForSubscription;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactPhone;

  /// No description provided for @copyToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy to clipboard'**
  String get copyToClipboard;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @noHistory.
  ///
  /// In en, this message translates to:
  /// **'No assessment history'**
  String get noHistory;

  /// No description provided for @clearHistory.
  ///
  /// In en, this message translates to:
  /// **'Clear History'**
  String get clearHistory;

  /// No description provided for @clearHistoryConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all history?'**
  String get clearHistoryConfirmation;

  /// No description provided for @exitProgressWarning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit? Your progress will be lost.'**
  String get exitProgressWarning;

  /// No description provided for @assessmentCompleted.
  ///
  /// In en, this message translates to:
  /// **'Assessment completed'**
  String get assessmentCompleted;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get arabic;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkTheme;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemTheme;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @noConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noConnection;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @musculoskeletal.
  ///
  /// In en, this message translates to:
  /// **'Musculoskeletal'**
  String get musculoskeletal;

  /// No description provided for @musculoskeletalDescription.
  ///
  /// In en, this message translates to:
  /// **'ACR Appropriateness Criteria for musculoskeletal imaging'**
  String get musculoskeletalDescription;

  /// No description provided for @acuteElbowForearmPain.
  ///
  /// In en, this message translates to:
  /// **'Acute Elbow or Forearm Pain'**
  String get acuteElbowForearmPain;

  /// No description provided for @acuteHandWristTrauma.
  ///
  /// In en, this message translates to:
  /// **'Acute Hand and Wrist Trauma'**
  String get acuteHandWristTrauma;

  /// No description provided for @acuteHipPain.
  ///
  /// In en, this message translates to:
  /// **'Acute Hip Pain'**
  String get acuteHipPain;

  /// No description provided for @acuteShoulderPain.
  ///
  /// In en, this message translates to:
  /// **'Acute Shoulder Pain'**
  String get acuteShoulderPain;

  /// No description provided for @acuteSpinalTraumaCervical.
  ///
  /// In en, this message translates to:
  /// **'Acute Spinal Trauma - Cervical Spine'**
  String get acuteSpinalTraumaCervical;

  /// No description provided for @acuteSpinalTraumaThoracicLumbar.
  ///
  /// In en, this message translates to:
  /// **'Acute Spinal Trauma - Thoracic/Lumbar Spine'**
  String get acuteSpinalTraumaThoracicLumbar;

  /// No description provided for @acuteTraumaAnkle.
  ///
  /// In en, this message translates to:
  /// **'Acute Trauma to the Ankle'**
  String get acuteTraumaAnkle;

  /// No description provided for @acuteTraumaFoot.
  ///
  /// In en, this message translates to:
  /// **'Acute Trauma to the Foot'**
  String get acuteTraumaFoot;

  /// No description provided for @acuteTraumaKnee.
  ///
  /// In en, this message translates to:
  /// **'Acute Trauma to the Knee'**
  String get acuteTraumaKnee;

  /// No description provided for @chronicAnklePain.
  ///
  /// In en, this message translates to:
  /// **'Chronic Ankle Pain'**
  String get chronicAnklePain;

  /// No description provided for @chronicElbowPain.
  ///
  /// In en, this message translates to:
  /// **'Chronic Elbow Pain'**
  String get chronicElbowPain;

  /// No description provided for @chronicExtremityJointPainInflammatory.
  ///
  /// In en, this message translates to:
  /// **'Chronic Extremity Joint Pain - Inflammatory Arthritis'**
  String get chronicExtremityJointPainInflammatory;

  /// No description provided for @chronicFootPain.
  ///
  /// In en, this message translates to:
  /// **'Chronic Foot Pain'**
  String get chronicFootPain;

  /// No description provided for @chronicHandWristPain.
  ///
  /// In en, this message translates to:
  /// **'Chronic Hand and Wrist Pain'**
  String get chronicHandWristPain;

  /// No description provided for @chronicHipPain.
  ///
  /// In en, this message translates to:
  /// **'Chronic Hip Pain'**
  String get chronicHipPain;

  /// No description provided for @chronicKneePain.
  ///
  /// In en, this message translates to:
  /// **'Chronic Knee Pain'**
  String get chronicKneePain;

  /// No description provided for @chronicShoulderPain.
  ///
  /// In en, this message translates to:
  /// **'Chronic Shoulder Pain'**
  String get chronicShoulderPain;

  /// No description provided for @imagingAfterShoulderArthroplasty.
  ///
  /// In en, this message translates to:
  /// **'Imaging After Shoulder Arthroplasty'**
  String get imagingAfterShoulderArthroplasty;

  /// No description provided for @imagingAfterTotalHipArthroplasty.
  ///
  /// In en, this message translates to:
  /// **'Imaging After Total Hip Arthroplasty'**
  String get imagingAfterTotalHipArthroplasty;

  /// No description provided for @imagingAfterTotalKneeArthroplasty.
  ///
  /// In en, this message translates to:
  /// **'Imaging After Total Knee Arthroplasty'**
  String get imagingAfterTotalKneeArthroplasty;

  /// No description provided for @inflammatoryBackPainAxial.
  ///
  /// In en, this message translates to:
  /// **'Inflammatory Back Pain - Axial Spondyloarthropathy'**
  String get inflammatoryBackPainAxial;

  /// No description provided for @malignantPrimaryMskTumor.
  ///
  /// In en, this message translates to:
  /// **'Malignant Primary MSK Tumor - Staging & Surveillance'**
  String get malignantPrimaryMskTumor;

  /// No description provided for @vertebralCompressionFractures.
  ///
  /// In en, this message translates to:
  /// **'Management of Vertebral Compression Fractures'**
  String get vertebralCompressionFractures;

  /// No description provided for @osteonecrosis.
  ///
  /// In en, this message translates to:
  /// **'Osteonecrosis'**
  String get osteonecrosis;

  /// No description provided for @osteoporosisBoneDensity.
  ///
  /// In en, this message translates to:
  /// **'Osteoporosis and Bone Mineral Density'**
  String get osteoporosisBoneDensity;

  /// No description provided for @stressFracture.
  ///
  /// In en, this message translates to:
  /// **'Stress (Fatigue/Insufficiency) Fracture'**
  String get stressFracture;

  /// No description provided for @suspectedOsteomyelitis.
  ///
  /// In en, this message translates to:
  /// **'Suspected Osteomyelitis/Septic Arthritis/Soft Tissue Infection'**
  String get suspectedOsteomyelitis;

  /// No description provided for @suspectedPrimaryBoneTumors.
  ///
  /// In en, this message translates to:
  /// **'Suspected Primary Bone Tumors'**
  String get suspectedPrimaryBoneTumors;

  /// No description provided for @questions.
  ///
  /// In en, this message translates to:
  /// **'questions'**
  String get questions;

  /// No description provided for @questionSingular.
  ///
  /// In en, this message translates to:
  /// **'question'**
  String get questionSingular;

  /// No description provided for @questionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} {count, plural, =1{question} other{questions}}'**
  String questionsCount(int count);

  /// No description provided for @hapticFeedback.
  ///
  /// In en, this message translates to:
  /// **'Haptic Feedback'**
  String get hapticFeedback;

  /// No description provided for @hapticFeedbackDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable tactile feedback for interactions'**
  String get hapticFeedbackDescription;

  /// No description provided for @homeTagline.
  ///
  /// In en, this message translates to:
  /// **'Evidence-Based Imaging Guidance'**
  String get homeTagline;

  /// No description provided for @homeDescriptionCard.
  ///
  /// In en, this message translates to:
  /// **'Navigate clinical imaging decisions with confidence using ACR Appropriateness Criteria guidelines.'**
  String get homeDescriptionCard;

  /// No description provided for @homeFeatureEvidenceBased.
  ///
  /// In en, this message translates to:
  /// **'Evidence\nBased'**
  String get homeFeatureEvidenceBased;

  /// No description provided for @homeFeatureAcrCriteria.
  ///
  /// In en, this message translates to:
  /// **'ACR\nCriteria'**
  String get homeFeatureAcrCriteria;

  /// No description provided for @homeFeatureQuickResults.
  ///
  /// In en, this message translates to:
  /// **'Quick\nResults'**
  String get homeFeatureQuickResults;

  /// No description provided for @homeFooterAcrBased.
  ///
  /// In en, this message translates to:
  /// **'Based on ACR Appropriateness Criteria®'**
  String get homeFooterAcrBased;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
