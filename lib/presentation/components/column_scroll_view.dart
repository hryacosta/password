import 'package:flutter/material.dart';

class ColumnScrollView extends StatelessWidget {
  const ColumnScrollView({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.textBaseline,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.verticalDirection = VerticalDirection.down,
    this.scrollViewKeyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    this.keyboardDismissBehavior = KeyboardDismissBehavior.manual,
    this.physics,
    this.padding,
    this.reverse = false,
    super.key,
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final ScrollViewKeyboardDismissBehavior scrollViewKeyboardDismissBehavior;
  final ScrollPhysics? physics;
  final KeyboardDismissBehavior keyboardDismissBehavior;
  final EdgeInsetsGeometry? padding;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    void onTap() {
      if (keyboardDismissBehavior == KeyboardDismissBehavior.onTap) {
        FocusScope.of(context).unfocus();
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) =>
            SingleChildScrollView(
          physics: physics,
          padding: padding,
          reverse: reverse,
          keyboardDismissBehavior: scrollViewKeyboardDismissBehavior,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              verticalDirection: verticalDirection,
              textDirection: textDirection,
              textBaseline: textBaseline,
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainAxisAlignment,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

/// A representation of how a [ScrollView] should dismiss the on-screen
/// keyboard.
enum KeyboardDismissBehavior {
  /// `manual` means there is no automatic dismissal of the on-screen keyboard.
  /// It is up to the client to dismiss the keyboard.
  manual,

  /// `onDrag` means that the [ScrollView] will dismiss an on-screen keyboard
  /// when a tap begins.
  onTap,
}
