class Env {
  Env._();

  static String get sentryDsn {
    const sentryDsn = String.fromEnvironment('SENTRY_DSN');
    if (sentryDsn.isEmpty) {
      throw Exception('SENTRY_DSN is not defined');
    }

    return sentryDsn;
  }
}
