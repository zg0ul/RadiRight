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
  String get selectTopic => 'اختر الموضوع';

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
  String get mayBeAppropriate => 'قد يكون مناسباً';

  @override
  String get usuallyNotAppropriate => 'غير مناسب عادة';

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
  String get musculoskeletalDescription =>
      'معايير ملاءمة ACR لتصوير العضلات والهيكل العظمي';

  @override
  String get acuteElbowForearmPain => 'ألم حاد في الكوع أو الساعد';

  @override
  String get acuteHandWristTrauma => 'إصابة حادة في اليد والمعصم';

  @override
  String get acuteHipPain => 'ألم حاد في الورك';

  @override
  String get acuteShoulderPain => 'ألم حاد في الكتف';

  @override
  String get acuteSpinalTraumaCervical =>
      'إصابة حادة في العمود الفقري - الفقرات العنقية';

  @override
  String get acuteSpinalTraumaThoracicLumbar =>
      'إصابة حادة في العمود الفقري - الفقرات الصدرية/القطنية';

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
  String get chronicExtremityJointPainInflammatory =>
      'ألم مزمن في مفاصل الأطراف - التهاب المفاصل';

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
  String get imagingAfterTotalHipArthroplasty =>
      'التصوير بعد تبديل مفصل الورك الكلي';

  @override
  String get imagingAfterTotalKneeArthroplasty =>
      'التصوير بعد تبديل مفصل الركبة الكلي';

  @override
  String get inflammatoryBackPainAxial =>
      'ألم الظهر الالتهابي - التهاب الفقار المحوري';

  @override
  String get malignantPrimaryMskTumor =>
      'أورام العضلات والهيكل العظمي الأولية الخبيثة - التدريج والمتابعة';

  @override
  String get vertebralCompressionFractures => 'إدارة كسور الفقرات الانضغاطية';

  @override
  String get osteonecrosis => 'تنخر العظم';

  @override
  String get osteoporosisBoneDensity => 'هشاشة العظام وكثافة المعادن العظمية';

  @override
  String get stressFracture => 'كسور الإجهاد';

  @override
  String get suspectedOsteomyelitis =>
      'اشتباه التهاب العظم والنقي/التهاب المفاصل الإنتاني/عدوى الأنسجة الرخوة';

  @override
  String get suspectedPrimaryBoneTumors => 'اشتباه أورام العظام الأولية';
}
