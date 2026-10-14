import 'package:flutter/foundation.dart';

void devLog(Object data, [String tag = "LOCAL DEVELOPMENT LOG"]) {
  if (kDebugMode) {
    print("$tag :: $data");
  }
}
