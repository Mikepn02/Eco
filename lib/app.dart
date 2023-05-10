import 'package:etrade_actions/bindings/general_bindings.dart';
import 'package:etrade_actions/routes/app_routes.dart';
import 'package:etrade_actions/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:etrade_actions/utils/constants/text_strings.dart';
import 'package:etrade_actions/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: TColors.white,),
        ),
        backgroundColor: TColors.primary,
      ),
    );
  }
}
