import 'package:flutter/foundation.dart';

class Logger {
  static void log(dynamic value) {
    if (kDebugMode) {
      print(value);
    }
  }
}
