import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/home/home_screen.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/provider/app_config_provider.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute:HomeScreen.routName ,
    routes: {
      HomeScreen.routName:(context)=>HomeScreen(),
    },
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      themeMode: provider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.AppLanguage),
    );
  }

}