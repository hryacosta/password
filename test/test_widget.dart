import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:password/core/theme/custom.dart';
import 'package:password/data/datasources/spaces_remote_datasource.dart';
import 'package:password/domain/repositories/spaces_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  SpaceRepository,
  SharedPreferences,
  http.Client,
  SpaceRemoteDataSource,
  GetIt,
])
class TestWidget extends StatelessWidget {
  const TestWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = $appTheme;

    return MaterialApp(
      theme: theme,
      // theme: baseTheme.copyWith(
      //   textTheme: GoogleFonts.aBeeZeeTextTheme(baseTheme.textTheme),
      // ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
      home: child,
    );
  }
}
