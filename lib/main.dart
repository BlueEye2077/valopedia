import 'package:flutter/material.dart';
import 'package:valopedia/app_router.dart';

void main() {
  runApp(ValopediaApp(appRouter: AppRouter()));
}

class ValopediaApp extends StatelessWidget {
  final AppRouter appRouter;

  const ValopediaApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valopedia',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

