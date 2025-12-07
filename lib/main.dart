import 'package:flutter/material.dart';
import 'package:plant_app/core/init/di_container.dart' as di;
import 'package:plant_app/core/routes/app_router.dart';
import 'package:plant_app/core/themes/app_light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Hubx Demo Plant App',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Theme(
          data: AppTheme.getTheme(context),
          child: child!,
        );
      },
      routerConfig: _appRouter.config(),
    );
  }
}