import 'package:flutter/material.dart';
import 'package:harmonify/const/colors.dart';

const bold = "MigaeSemibold-3zd2M";
const regular = "Queensides-3z7Ey";
ourStyle({family = "MigaeSemibold-3zd2M", double? size = 14, color = whiteColor}){
  return TextStyle(
            fontSize: size,
            color: color,
            fontFamily: family,
          );
}