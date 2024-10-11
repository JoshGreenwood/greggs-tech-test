import 'package:flutter/material.dart';

import 'features/product_list/ui/product_list_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sausage Roll',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00558f)),
        useMaterial3: true,
      ),
      home: ProductListView.wrapped(),
    );
  }
}
