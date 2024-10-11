import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/theme/theme_factory.dart';

import 'features/product_list/ui/product_list_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sausage Roll',
      theme: ThemeFactory.build(),
      home: ProductListView.wrapped(),
    );
  }
}
