import 'package:flutter/material.dart';
import 'package:to_do_app/add_list/add_list_tab.dart';
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
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        ),
        bottomNavigationBar: BottomNavigationBar(
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
        body: selectedIndex == 0 ? AddListgTab() : SettingTab());
  }
}
