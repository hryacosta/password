import 'package:flutter/foundation.dart'; //import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> googleFonts() async {
  GoogleFonts.config.allowRuntimeFetching = false;

  LicenseRegistry.addLicense(() async* {
    // final license = await rootBundle.loadString('google_fonts/OFL.txt');
    //
    // yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}
