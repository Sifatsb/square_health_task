import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


extension WidgetExtension on num {
  Widget get horizontalSpacing => SizedBox(width: toDouble());

  Widget get verticalSpacing => SizedBox(height: toDouble());

  BorderRadius get circularRadius => BorderRadius.circular(toDouble());
}

bool eligibleForExtension(ScrollController? scrollController) {
  if (scrollController!.position.pixels ==
          scrollController.position.maxScrollExtent ||
      scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
    return true;
  }
  return false;
}

extension StringExtension on String {
  // ignore: non_constant_identifier_names
  String get dd_mm_yyyy => DateFormat('dd/MM/yyyy').format(
        DateFormat(this).parse(
          toString(),
        ),
      );

  // ignore: non_constant_identifier_names
  String get mmm_dd_yyyy => DateFormat('MMM dd yyy').format(
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(
          toString(),
        ),
      );

  // ignore: non_constant_identifier_names
  String get dd_mmm_yyyy => DateFormat('dd MMM yyy').format(
        DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(
          toString(),
        ),
      );

  String get nonZeroText {
    String value = double.parse(this).toStringAsFixed(2).toString();
    if (value.contains('.')) {
      List<String> a = value.split('.');

      if (a[1] == '00' || a[1] == '0') {
        return a[0];
      }
    }

    return value;
  }
}


extension DateExtension on DateTime {
  // ignore: non_constant_identifier_names
  String get dd_mm_yyyy => DateFormat('dd/MM/yyyy').format(this).toString();
  // ignore: non_constant_identifier_names
  String get yyyy_mm_dd => DateFormat('yyyy-MM-dd').format(this).toString();
}
