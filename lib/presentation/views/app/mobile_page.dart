import 'package:flutter/material.dart';
import 'package:password/presentation/providers/login_provider.dart';
import 'package:password/presentation/views/home/home_mobile.dart';
import 'package:provider/provider.dart';

class MobilePage extends StatelessWidget {
  const MobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: const HomeMobile(),
    );
  }
}
