import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:radi_right/l10n/app_localizations.dart';

class ExternalLinks {
  ExternalLinks._();

  static final Uri privacyPolicy = Uri.parse('https://sites.google.com/view/radiright-privacy-policy/home');

  // Kept as a separate constant so both the signup page and settings stay consistent.
  static final Uri termsAndConditions = Uri.parse('https://sites.google.com/view/radiright-privacy-policy/home');
}

Future<void> openExternalLink(BuildContext context, Uri uri) async {
  final ok = await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
  if (!ok && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.couldNotOpenLink)));
  }
}
