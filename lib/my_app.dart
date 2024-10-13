import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:greggs_sausage_roll/dependency_injection.dart';
import 'package:greggs_sausage_roll/features/cart/presentation/cart_cubit.dart';
import 'package:greggs_sausage_roll/theme/theme_factory.dart';

import 'features/product_list/ui/product_list_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CartCubit>()),
      ],
      child: MaterialApp(
        title: 'Sausage Roll',
        theme: ThemeFactory.build(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ProductListView.wrapped(),
      ),
    );
  }
}
