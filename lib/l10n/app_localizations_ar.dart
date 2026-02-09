// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'راديرايت';

  @override
  String get acrAppropriatenessCriteria => 'معايير ملاءمة ACR';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get name => 'الاسم';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟';

  @override
  String get alreadyHaveAccount => 'لديك حساب بالفعل؟';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get logoutConfirmation => 'هل أنت متأكد من تسجيل الخروج؟';

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirm => 'تأكيد';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get home => 'الرئيسية';

  @override
  String get history => 'السجل';

  @override
  String get settings => 'الإعدادات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get startAssessment => 'بدء التقييم';

  @override
  String get selectPanel => 'اختر اللوحة';

  @override
  String get selectPanelSubtitle => 'Choose the clinical specialty relevant to your patient\'s case.';

  @override
  String get selectTopic => 'اختر الموضوع';

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
  String get mayBeAppropriate => 'قد يكون مناسباً';

  @override
  String get usuallyNotAppropriate => 'غير مناسب عادة';

  @override
  String get clinicalJudgment => 'Clinical Judgment';

  @override
  String get clinicalJudgmentDisclaimer =>
      'These recommendations are based on ACR Appropriateness Criteria® and should be used in conjunction with clinical judgment, considering individual patient factors, institutional protocols, and the specific clinical context.';

  @override
  String get searchTopics => 'البحث في المواضيع...';

  @override
  String get question => 'السؤال';

  @override
  String questionProgress(int current, int total) {
    return 'السؤال $current من $total';
  }

  @override
  String get back => 'رجوع';

  @override
  String get next => 'التالي';

  @override
  String get viewResults => 'عرض النتائج';

  @override
  String get results => 'النتائج';

  @override
  String get assessmentResults => 'نتائج التقييم';

  @override
  String get imagingRecommendations => 'توصيات التصوير';

  @override
  String get noRecommendations => 'لا توجد توصيات للتصوير';

  @override
  String get procedure => 'الإجراء';

  @override
  String get appropriateness => 'الملاءمة';

  @override
  String get radiation => 'الإشعاع';

  @override
  String get comments => 'التعليقات';

  @override
  String get usuallyAppropriate => 'مناسب عادة';

  @override
  String get noImagingIndicated => 'لا يوجد مؤشر للتصوير';

  @override
  String get radiationNone => 'لا يوجد';

  @override
  String get radiationLow => 'منخفض';

  @override
  String get radiationMedium => 'متوسط';

  @override
  String get radiationHigh => 'عالي';

  @override
  String get subscription => 'الاشتراك';

  @override
  String get subscriptionStatus => 'حالة الاشتراك';

  @override
  String get trial => 'تجريبي';

  @override
  String get trialActive => 'الفترة التجريبية نشطة';

  @override
  String get trialExpired => 'انتهت الفترة التجريبية';

  @override
  String get monthly => 'شهري';

  @override
  String get yearly => 'سنوي';

  @override
  String daysRemaining(int days) {
    return '$days أيام متبقية';
  }

  @override
  String get subscriptionExpired => 'انتهى اشتراكك';

  @override
  String get contactUs => 'تواصل معنا';

  @override
  String get contactForSubscription => 'تواصل معنا للاشتراك';

  @override
  String get contactEmail => 'البريد الإلكتروني';

  @override
  String get contactPhone => 'الهاتف';

  @override
  String get copyToClipboard => 'نسخ';

  @override
  String get copiedToClipboard => 'تم النسخ';

  @override
  String get noHistory => 'لا يوجد سجل تقييمات';

  @override
  String get clearHistory => 'مسح السجل';

  @override
  String get clearHistoryConfirmation => 'هل أنت متأكد من مسح كل السجل؟';

  @override
  String get exitProgressWarning => 'هل أنت متأكد من الخروج؟ سيتم فقدان تقدمك.';

  @override
  String get assessmentCompleted => 'اكتمل التقييم';

  @override
  String get viewDetails => 'عرض التفاصيل';

  @override
  String get language => 'اللغة';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get theme => 'المظهر';

  @override
  String get lightTheme => 'فاتح';

  @override
  String get darkTheme => 'داكن';

  @override
  String get systemTheme => 'النظام';

  @override
  String get error => 'خطأ';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get noConnection => 'لا يوجد اتصال بالإنترنت';

  @override
  String get somethingWentWrong => 'حدث خطأ ما';

  @override
  String get tryAgain => 'حاول مرة أخرى';

  @override
  String get musculoskeletal => 'العضلات والهيكل العظمي';

  @override
  String get musculoskeletalDescription => 'معايير ملاءمة ACR لتصوير العضلات والهيكل العظمي';

  @override
  String get acuteElbowForearmPain => 'ألم حاد في الكوع أو الساعد';

  @override
  String get acuteHandWristTrauma => 'إصابة حادة في اليد والمعصم';

  @override
  String get acuteHipPain => 'ألم حاد في الورك';

  @override
  String get acuteShoulderPain => 'ألم حاد في الكتف';

  @override
  String get acuteSpinalTraumaCervical => 'إصابة حادة في العمود الفقري - الفقرات العنقية';

  @override
  String get acuteSpinalTraumaThoracicLumbar => 'إصابة حادة في العمود الفقري - الفقرات الصدرية/القطنية';

  @override
  String get acuteTraumaAnkle => 'إصابة حادة في الكاحل';

  @override
  String get acuteTraumaFoot => 'إصابة حادة في القدم';

  @override
  String get acuteTraumaKnee => 'إصابة حادة في الركبة';

  @override
  String get chronicAnklePain => 'ألم مزمن في الكاحل';

  @override
  String get chronicElbowPain => 'ألم مزمن في الكوع';

  @override
  String get chronicExtremityJointPainInflammatory => 'ألم مزمن في مفاصل الأطراف - التهاب المفاصل';

  @override
  String get chronicFootPain => 'ألم مزمن في القدم';

  @override
  String get chronicHandWristPain => 'ألم مزمن في اليد والمعصم';

  @override
  String get chronicHipPain => 'ألم مزمن في الورك';

  @override
  String get chronicKneePain => 'ألم مزمن في الركبة';

  @override
  String get chronicShoulderPain => 'ألم مزمن في الكتف';

  @override
  String get imagingAfterShoulderArthroplasty => 'التصوير بعد تبديل مفصل الكتف';

  @override
  String get imagingAfterTotalHipArthroplasty => 'التصوير بعد تبديل مفصل الورك الكلي';

  @override
  String get imagingAfterTotalKneeArthroplasty => 'التصوير بعد تبديل مفصل الركبة الكلي';

  @override
  String get inflammatoryBackPainAxial => 'ألم الظهر الالتهابي - التهاب الفقار المحوري';

  @override
  String get malignantPrimaryMskTumor => 'أورام العضلات والهيكل العظمي الأولية الخبيثة - التدريج والمتابعة';

  @override
  String get vertebralCompressionFractures => 'إدارة كسور الفقرات الانضغاطية';

  @override
  String get osteonecrosis => 'تنخر العظم';

  @override
  String get osteoporosisBoneDensity => 'هشاشة العظام وكثافة المعادن العظمية';

  @override
  String get stressFracture => 'كسور الإجهاد';

  @override
  String get suspectedOsteomyelitis => 'اشتباه التهاب العظم والنقي/التهاب المفاصل الإنتاني/عدوى الأنسجة الرخوة';

  @override
  String get suspectedPrimaryBoneTumors => 'اشتباه أورام العظام الأولية';

  @override
  String get questions => 'أسئلة';

  @override
  String get questionSingular => 'سؤال';

  @override
  String questionsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: 'أسئلة', one: 'سؤال');
    return '$count $_temp0';
  }

  @override
  String get hapticFeedback => 'ردود الفعل اللمسية';

  @override
  String get hapticFeedbackDescription => 'تفعيل ردود الفعل اللمسية للتفاعلات';

  @override
  String get homeTagline => 'إرشادات التصوير المبنية على الأدلة';

  @override
  String get homeDescriptionCard => 'اتخذ قرارات التصوير السريري بثقة باستخدام معايير ملاءمة ACR.';

  @override
  String get homeFeatureEvidenceBased => 'مبني على\nالأدلة';

  @override
  String get homeFeatureAcrCriteria => 'معايير\nACR';

  @override
  String get homeFeatureQuickResults => 'نتائج\nسريعة';

  @override
  String get homeFooterAcrBased => 'بناءً على معايير ملاءمة ACR®';

  @override
  String get recommendationFound => 'تم العثور على توصية';

  @override
  String get resultBasedOnAcr => 'بناءً على معايير ملاءمة ACR';

  @override
  String get acr => 'ACR';

  @override
  String get whyThisRecommendation => 'لماذا هذه التوصية؟';

  @override
  String radiationLevel(String level) {
    return 'الإشعاع: $level';
  }
}
