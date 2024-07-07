import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/widgets.dart';

class Message extends StatelessWidget {
  const Message(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
  });

  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final Color? selectionColor;
  final ui.TextHeightBehavior? textHeightBehavior;
  final TextScaler? textScaler;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      selectionColor: selectionColor,
      textHeightBehavior: textHeightBehavior,
      textScaler: textScaler ?? TextScaler.noScaling,
    );
  }
}
