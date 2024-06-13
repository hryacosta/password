import 'package:flutter/widgets.dart';

class OptionIcon extends StatelessWidget {
  const OptionIcon({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      child: Text(title),
    );
  }
}
