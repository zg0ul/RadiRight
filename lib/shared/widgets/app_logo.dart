import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Center(
      child: SvgPicture.asset(
        isDarkMode ? 'assets/logos/radi_right_dark.svg' : 'assets/logos/radi_right_light.svg',
        width: 120.w,
        height: 120.w,
        // colorFilter: ColorFilter.mode(theme.colorScheme.onPrimary, BlendMode.srcIn),
      ),
    );
  }
}
