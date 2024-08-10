import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class UuidUtil {
  String v4() {
    return const Uuid().v4();
  }
}

final uuidUtilProvider = Provider<UuidUtil>((ref) {
  return UuidUtil();
});
