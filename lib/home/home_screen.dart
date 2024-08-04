import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/add_list/add_list_tab.dart';
import 'package:to_do_app/add_list/add_task.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/setting/setting_tab.dart';

import '../provider/app_config_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routName ='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.fromLTRB(10, 35, 0, 10),
            child: Text(
              "To Do List",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Theme(
            data: Theme.of(context)
                .copyWith(canvasColor: Theme.of(context).primaryColor),
            child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.list,
                        size: 30,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.settings,
                        size: 30,
                      ),
                      label: ''),
                ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showBottomSheet();
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: 90,
            color: AppColors.primaryColor,
          ),
          selectedIndex == 0 ? AddListgTab() : SettingTab()
        ]));
  }

  void showBottomSheet() {
    showModalBottomSheet(
      backgroundColor:
          provider.isDark() ? AppColors.blackDarkColor : AppColors.whiteColor,
      context: context,
      builder: (context) => AddTaskBottomSheet(),
    );
  }
}
