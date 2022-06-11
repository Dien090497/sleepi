import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:url_launcher/url_launcher.dart';

void launchInsurance(BuildContext context) async {
  final String url;
  switch (context.locale.languageCode) {
    case "de":
      url = Const.whitePaperInsuranceEn;
      break;
    case "en":
      url = Const.whitePaperInsuranceEn;
      break;
    case "es":
      url = Const.whitePaperInsuranceEn;
      break;
    case "fr":
      url = Const.whitePaperInsuranceEn;
      break;
    case "ja":
      url = Const.whitePaperInsuranceJa;
      break;
    case "pt":
      url = Const.whitePaperInsuranceEn;
      break;
    case "ru":
      url = Const.whitePaperInsuranceEn;
      break;
    case "zh":
      url = Const.whitePaperInsuranceEn;
      break;
    default:
      url = Const.whitePaperInsuranceEn;
  }
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch';
  }
}
