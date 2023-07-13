import 'package:flutter/material.dart';

import 'colors.dart';

class TextStyles {
  static const kBoldTextStyle = TextStyle(fontWeight: FontWeight.bold);
  static const kWhiteTextStyle = TextStyle(color: ColorStyles.kWhite);
  static const kQuestionTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  static const kWebViewTextStyle = TextStyle(
      color: ColorStyles.kWebViewText, decoration: TextDecoration.underline);
  static const kTeamIntroduceTitleTextStyle =
      TextStyle(fontSize: 20, color: ColorStyles.kWhite);
  static const kTeamPageTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 23, color: ColorStyles.kLightGrey);
  static const kTeamPageNormalTextStyle =
      TextStyle(fontSize: 15, color: ColorStyles.kLightGrey);
  static const kAlertDialogPositiveTextStyle =
      TextStyle(color: ColorStyles.kAlertDialogPositive);
}
