import 'package:flutter/cupertino.dart';

class Spacing {
  Spacing._();

  static const xs = 4.0;
  static const s = 8.0;
  static const m = 16.0;
  static const l = 24.0;
  static const xl = 32.0;
  static const xxl = 48.0;
  static const page = 20.0;

  static const vxs = SizedBox(height: xs);
  static const vs = SizedBox(height: s);
  static const vm = SizedBox(height: m);
  static const vl = SizedBox(height: l);
  static const vxl = SizedBox(height: xl);
  static const vxxl = SizedBox(height: xxl);

  static const hxs = SizedBox(width: xs);
  static const hs = SizedBox(width: s);
  static const hm = SizedBox(width: m);
  static const hl = SizedBox(width: l);
  static const hxl = SizedBox(width: xl);
}
