import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/app_colors.dart';

import '../provider/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
        color: provider.isDark() ? Color(0xff151b30) : Color(0xffffffff),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.light);
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 1),
                  child: provider.appTheme == ThemeMode.light
                      ? getSelectedLanguage(AppLocalizations.of(context)!.light)
                      : unGetSelectedLanguge(
                          AppLocalizations.of(context)!.light),
                )),
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  provider.changeTheme(ThemeMode.dark);
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: provider.isDark()
                      ? getSelectedLanguage(AppLocalizations.of(context)!.dark)
                      : unGetSelectedLanguge(
                          AppLocalizations.of(context)!.dark),
                )),
          ],
        ));
  }

  Widget getSelectedLanguage(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColors.primaryColor),
        ),
        Icon(
          Icons.check,
          color: AppColors.primaryColor,
          size: 25,
        )
      ],
    );
  }

  Widget unGetSelectedLanguge(String text) {
    return Row(
      children: [
        Text(text, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
