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
              // padding: EdgeInsets.fromLTRB(15, 5, 5, 15),
              //showMonthPicker: false,
              monthStyle: TextStyle(
                color: AppColors.blackDarkColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              selectedDateStyle: TextStyle(
                color: AppColors.blackDarkColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              dateFormatter: DateFormatter.fullDateDayAsStrMY(),
            ),
            dayProps: EasyDayProps(
              borderColor: AppColors.blackDarkColor,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.17,
              todayStyle: DayStyle(
                decoration: BoxDecoration(
                  color: provider.isDark()
                      ? AppColors.blackDarkColor
                      : Colors.white,
                  border: Border.all(color: AppColors.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                dayStrStyle: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color:
                      provider.isDark() ? AppColors.whiteColor : Colors.black,
                  // Change the text color if needed
                ),
                dayNumStyle: TextStyle(
                    color:
                        provider.isDark() ? AppColors.whiteColor : Colors.black,
                    fontWeight:
                        FontWeight.bold // Change the text color if needed
                    ),
              ),
              todayHighlightStyle: TodayHighlightStyle.withBorder,
              todayHighlightColor: AppColors.primaryColor,
              //   todayHighlightStyle: TodayHighlightStyle.withBackground,

              inactiveDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: provider.isDark()
                      ? AppColors.blackDarkColor
                      : Colors.white,
                ),
                dayStrStyle: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color:
                      provider.isDark() ? AppColors.whiteColor : Colors.black,
                  // Change the text color if needed
                ),
                dayNumStyle: TextStyle(
                    color:
                        provider.isDark() ? AppColors.whiteColor : Colors.black,
                    fontWeight:
                        FontWeight.bold // Change the text color if needed
                    ),
              ),
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                dayNumStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
                dayStrStyle: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: provider.isDark()
                        ? [AppColors.blackDarkColor, AppColors.blackDarkColor]
                        : [Color(0xffffffff), Color(0xffffffff)],
                  ),
                ),
              ),
            ),
            timeLineProps: const EasyTimeLineProps(
              hPadding: 16.0, // padding from left and right
              separatorPadding: 16.0,
              // margin: EdgeInsets.all(10)// padding between days
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
