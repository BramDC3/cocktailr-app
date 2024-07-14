import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Logger {
  Logger(
    this._talker,
  );

  final Talker _talker;

  void debug(String tag, String message) => _talker.debug(_formatMessage(tag, message));

  void verbose(String tag, String message) => _talker.verbose(_formatMessage(tag, message));

  void info(String tag, String message) => _talker.info(_formatMessage(tag, message));

  void warning(String tag, String message) => _talker.warning(_formatMessage(tag, message));

  void error(String tag, String message, Object exception, StackTrace stackTrace) =>
      _talker.error(_formatMessage(tag, message), error, stackTrace);

  String _formatMessage(String tag, String message) {
    return '[$tag] $message';
  }
}

final loggerProvider = Provider<Logger>((ref) {
  return Logger(
    talkerInstance,
  );
});

final talkerInstance = TalkerFlutter.init();
