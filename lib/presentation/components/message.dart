import 'dart:ui' as ui show TextHeightBehavior;

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as app;
import 'package:password/core/utils/app_localization.dart';

class Message extends StatefulWidget {
  const Message(
    this.id, {
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
  final String id;

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late app.AppLocalizations localizations;

  @override
  void initState() {
    localizations = AppLocalization.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      // widget.id,
      localizations.translate(widget.id),
      style: widget.style,
      strutStyle: widget.strutStyle,
      textAlign: widget.textAlign,
      textDirection: widget.textDirection,
      locale: widget.locale,
      softWrap: widget.softWrap,
      overflow: widget.overflow,
      maxLines: widget.maxLines,
      semanticsLabel: widget.semanticsLabel,
      textWidthBasis: widget.textWidthBasis,
      selectionColor: widget.selectionColor,
      textHeightBehavior: widget.textHeightBehavior,
      textScaler: widget.textScaler ?? TextScaler.noScaling,
    );
  }
}
