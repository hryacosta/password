import 'package:flutter/material.dart';
import 'package:password/core/utils/app_localization.dart';
import 'package:password/presentation/components/button.dart';
import 'package:password/presentation/components/input/input_field.dart';
import 'package:password/presentation/components/message.dart';
import 'package:password/presentation/providers/home_provider.dart';
import 'package:password/presentation/route/app_route.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider _provider;

  @override
  void initState() {
    _provider = HomeProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Builder(
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              children: [
                const Message('Total passwords: 0'),
                const SizedBox(
                  height: 45,
                ),
                InputField(
                  onChange: _provider.changeTitle,
                  labelText: localization.login,
                ),
                InputField(
                  onChange: _provider.changeUsername,
                  labelText: localization.username,
                ),
                InputField(
                  onChange: _provider.changePassword,
                  labelText: localization.password,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 400,
                  child: Button(
                    label: localization.add,
                    onPress: onPress,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> onPress() async {
    await _provider.addPassword();
  }

  void onPressed() {
    const LoginRoute().go(context);
  }
}
