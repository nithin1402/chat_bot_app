import 'package:flutter/material.dart';

class AppColors{
  static Color mainBlack = Color(0xff101010);
  static Color secondaryBlack = Color(0xff1F2023);
  static Color greyBlack = Color(0xff424040);
}

TextStyle mTextStyle10({Color mColor=Colors.black,FontWeight mFontWeight = FontWeight.normal}) {
  return TextStyle(
      fontWeight: mFontWeight,
      color: mColor,
      fontSize: 10
  );
}

  TextStyle mTextStyle12({Color mColor=Colors.black,FontWeight mFontWeight = FontWeight.normal}) {
    return TextStyle(
        fontWeight: mFontWeight,
        color: mColor,
        fontSize: 12
    );
  }

  TextStyle mTextStyle16({Color mColor=Colors.black,FontWeight mFontWeight = FontWeight.normal}) {
    return TextStyle(
        fontWeight: mFontWeight,
        color: mColor,
        fontSize: 16
    );
  }
  TextStyle mTextStyle20({Color mColor=Colors.black,FontWeight mFontWeight = FontWeight.normal}) {
    return TextStyle(
        fontWeight: mFontWeight,
        color: mColor,
        fontSize: 20
    );
  }
  TextStyle mTextStyle24({Color mColor=Colors.black,FontWeight mFontWeight = FontWeight.normal}) {
    return TextStyle(
        fontWeight: mFontWeight,
        color: mColor,
        fontSize: 24
    );
  }