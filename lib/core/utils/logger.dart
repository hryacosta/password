import 'package:logger/logger.dart';

/// Var logger = Logger(.
final Logger logger = Logger(
  printer: PrettyPrinter(),
  level: Level.debug,
);

/// LoggerNoStack.
final Logger loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
);
