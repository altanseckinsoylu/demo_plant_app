import 'package:flutter/material.dart';

extension PaddingExtension on num {
  EdgeInsets get paddingAll => EdgeInsets.all(toDouble());
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get paddingRight => EdgeInsets.only(right: toDouble());
  EdgeInsets get paddingLeft => EdgeInsets.only(left: toDouble());
  EdgeInsets get paddingTop => EdgeInsets.only(top: toDouble());
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: toDouble());
}