import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/add_list/add_list_item.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/provider/provider_list.dart';

import '../provider/app_config_provider.dart';

class AddListgTab extends StatefulWidget {
  @override
  State<AddListgTab> createState() => _AddListgTabState();
}

class _AddListgTabState extends State<AddListgTab> {
  @override
  Widget build(BuildContext context) {
    var providerList = Provider.of<ProviderList>(context);
    if (providerList.tasksList.isEmpty) {
      providerList.getAllTasksFromFireStore();
    }
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      child: Column(
        children: [
          EasyDateTimeLine(
            locale: provider.AppLanguage,
            initialDate: providerList.selectDate,
            onDateChange: (selectedDate) {
              providerList.changeSelectDate(selectedDate);
            },
            headerProps: EasyHeaderProps(
              monthStyle: TextStyle(
                color: provider.isDark() ? AppColors.whiteColor : Colors.black,
              ),
              monthPickerType: MonthPickerType.switcher,
              selectedDateStyle: TextStyle(
                color: provider.isDark() ? AppColors.whiteColor : Colors.black,
              ),
              dateFormatter: DateFormatter.fullDateDMY(),
            ),
            dayProps: EasyDayProps(
              inactiveDayStyle: DayStyle(
                dayNumStyle: TextStyle(
                    color:
                        provider.isDark() ? AppColors.whiteColor : Colors.black,
                    fontWeight:
                        FontWeight.bold // Change the text color if needed
                    ),
              ),
              dayStructure: DayStructure.dayStrDayNumMonth,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff3371FF),
                      Color(0xff8426D6),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
              itemBuilder: (context, index) => AddListItem(
                task: providerList.tasksList[index],
              ),
              itemCount: providerList.tasksList.length,
            ),
          )
        ],
      ),
    );
  }
}
