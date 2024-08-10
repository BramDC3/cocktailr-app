import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeUtil {
  DateTime now() => DateTime.now();
}

final timeUtilProvider = Provider<TimeUtil>((ref) {
  return TimeUtil();
});
