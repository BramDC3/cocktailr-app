import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CrashReportingService {
  void reportNonFatalError(Object error, StackTrace stackTrace) {
    Sentry.captureException(error, stackTrace: stackTrace);
  }
}

final crashReportingServiceProvider = Provider<CrashReportingService>((ref) {
  return CrashReportingService();
});
