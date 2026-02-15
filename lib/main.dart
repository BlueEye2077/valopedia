import 'package:flutter/material.dart';
import 'app_router.dart';
import 'constants/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PaintingBinding.instance.imageCache.maximumSize = 200;
  PaintingBinding.instance.imageCache.maximumSizeBytes = 300 << 20; // 300 MB
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
