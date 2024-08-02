import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/home/home_screen.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/provider/app_config_provider.dart';
import 'package:to_do_app/provider/provider_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: 'AIzaSyCnzOKE3lU-k-LutWqTigfTGNPHeyMbe50',
              appId: 'com.example.to_do_app',
              messagingSenderId: '914191309801',
              projectId: 'todo-app-66341'))
      : await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();

  runApp(MultiProvider(
    child: MyApp(),
    providers: [
      ChangeNotifierProvider(
        create: (context) => AppConfigProvider(),
      ),
      ChangeNotifierProvider(create: (context) => ProviderList())
    ],
  ));
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
        // EditTask.routeName:(context)=>EditTask(task: task,)
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