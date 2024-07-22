import 'package:flutter/material.dart';
import 'package:to_do_app/add_list/add_list_tab.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/setting/settinr_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routName ='home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To Do List"),
          //  toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(children: [
          Container(
            width: double.infinity,
            height: 90,
            color: AppColors.primaryColor,
          ),
          Expanded(child: selectedIndex == 0 ? AddListgTab() : SettingTab())
        ]));
  }
}
