import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/app_colors.dart';

import '../provider/app_config_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(

        // margin: EdgeInsets.all(15),

        color: provider.isDark() ? AppColors.blackDarkColor : Color(0xffffffff),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 1),
                child: provider.AppLanguage == 'en'
                    ? getSelectedLanguage(AppLocalizations.of(context)!.english)
                    : unGetSelectedLanguge(
                        AppLocalizations.of(context)!.english),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
                onTap: () {
                  provider.changeLanguage('ar');
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                  child: provider.AppLanguage == 'ar'
                      ? getSelectedLanguage(
                          AppLocalizations.of(context)!.arabic)
                      : unGetSelectedLanguge(
                          AppLocalizations.of(context)!.arabic),
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
        Text(text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: provider.isDark()
                    ? AppColors.whiteColor
                    : AppColors.blackColor)),
      ],
    );
  }
}
