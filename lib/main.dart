import 'package:flutter/material.dart';
import 'app_router.dart';
import 'constants/theme.dart';

void main() {
  runApp(ValopediaApp(appRouter: AppRouter()));
}

class ValopediaApp extends StatelessWidget {
  final AppRouter appRouter;

  const ValopediaApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: kThemeData,
      title: 'Valopedia',
      debugShowCheckedModeBanner: false,      
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
