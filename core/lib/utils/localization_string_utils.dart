import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

extension LocalizationStringUtils on String {
  String watchTr(
    BuildContext context, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    context.locale;
    return this.tr(args: args, namedArgs: namedArgs, gender: gender);
  }

  String watchPlural(
    BuildContext context,
    num value, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? name,
    NumberFormat? format,
  }) {
    context.locale;
    return this.plural(
      value,
      args: args,
      namedArgs: namedArgs,
      name: name,
      format: format,
    );
  }
}

extension LocalizationTextUtils on Text {
  Text watchTr(
    BuildContext context, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    context.locale;
    return this.tr(args: args, namedArgs: namedArgs, gender: gender);
  }

  Text watchPlural(
    BuildContext context,
    num value, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? name,
    NumberFormat? format,
  }) {
    context.locale;
    return this.plural(
      value,
      args: args,
      namedArgs: namedArgs,
      name: name,
      format: format,
    );
  }
}
