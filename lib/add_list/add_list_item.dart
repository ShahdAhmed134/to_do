import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/app_colors.dart';

import '../provider/app_config_provider.dart';

class AddListItem extends StatelessWidget {
  const AddListItem({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: provider.isDark()
              ? AppColors.blackDarkColor
              : AppColors.whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            width: 4,
            height: 80,
            color: AppColors.primaryColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(AppLocalizations.of(context)!.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.primaryColor)),
                Text(AppLocalizations.of(context)!.desc,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
