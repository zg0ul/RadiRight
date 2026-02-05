import 'package:flutter/widgets.dart';
import '../constants/app_constants.dart';

/// Semantic spacer widgets for consistent spacing
class AppSpacer extends StatelessWidget {
  final double width;
  final double height;

  const AppSpacer._({this.width = 0, this.height = 0});

  // Vertical Spacers
  static Widget get verticalXS => AppSpacer._(height: AppConstants.spacingXS);
  static Widget get verticalSM => AppSpacer._(height: AppConstants.spacingSM);
  static Widget get verticalMD => AppSpacer._(height: AppConstants.spacingMD);
  static Widget get verticalLG => AppSpacer._(height: AppConstants.spacingLG);
  static Widget get verticalXL => AppSpacer._(height: AppConstants.spacingXL);
  static Widget get verticalXXL => AppSpacer._(height: AppConstants.spacingXXL);

  // Horizontal Spacers
  static Widget get horizontalXS => AppSpacer._(width: AppConstants.spacingXS);
  static Widget get horizontalSM => AppSpacer._(width: AppConstants.spacingSM);
  static Widget get horizontalMD => AppSpacer._(width: AppConstants.spacingMD);
  static Widget get horizontalLG => AppSpacer._(width: AppConstants.spacingLG);
  static Widget get horizontalXL => AppSpacer._(width: AppConstants.spacingXL);
  static Widget get horizontalXXL => AppSpacer._(width: AppConstants.spacingXXL);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}

/// Extension for easy padding access
extension AppPadding on BuildContext {
  EdgeInsets get paddingXS => EdgeInsets.all(AppConstants.spacingXS);
  EdgeInsets get paddingSM => EdgeInsets.all(AppConstants.spacingSM);
  EdgeInsets get paddingMD => EdgeInsets.all(AppConstants.spacingMD);
  EdgeInsets get paddingLG => EdgeInsets.all(AppConstants.spacingLG);
  EdgeInsets get paddingXL => EdgeInsets.all(AppConstants.spacingXL);

  EdgeInsets get paddingHorizontalSM =>
      EdgeInsets.symmetric(horizontal: AppConstants.spacingSM);
  EdgeInsets get paddingHorizontalMD =>
      EdgeInsets.symmetric(horizontal: AppConstants.spacingMD);
  EdgeInsets get paddingHorizontalLG =>
      EdgeInsets.symmetric(horizontal: AppConstants.spacingLG);

  EdgeInsets get paddingVerticalSM =>
      EdgeInsets.symmetric(vertical: AppConstants.spacingSM);
  EdgeInsets get paddingVerticalMD =>
      EdgeInsets.symmetric(vertical: AppConstants.spacingMD);
  EdgeInsets get paddingVerticalLG =>
      EdgeInsets.symmetric(vertical: AppConstants.spacingLG);
}
