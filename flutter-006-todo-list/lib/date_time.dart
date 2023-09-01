import 'package:flutter/foundation.dart';

void main(List<String> args) {
  var today = DateTime.now();
  if (kDebugMode) {
    print(today.toString());
  }
}
