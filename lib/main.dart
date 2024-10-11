import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/dependency_injection.dart';

import 'my_app.dart';

void main() {
  DependencyInjection.initialise();
  runApp(const MyApp());
}
