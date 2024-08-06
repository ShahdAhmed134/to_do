import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/firebase.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/provider/provider_list.dart';

import '../provider/app_config_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();
  String title = '';
  String desc = '';
  late ProviderList providerList;
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    providerList = Provider.of<ProviderList>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.new_task,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: provider.isDark()
                    ? AppColors.whiteColor
                    : AppColors.blackDarkColor),
          ),
          SizedBox(
            height: 25,
          ),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter task title';

                        /// invalid
                      }
                      return null;

                      /// valid
                    },
                    onChanged: (text) {
                      title = text;
                    },
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.task_title,
                      hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.grayColor),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'please enter task details';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      desc = text;
                    },
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.task_desc,
                      hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.grayColor),
                ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppLocalizations.of(context)!.date,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  InkWell(
                    onTap: () {
                      showCalender();
                    },
                    child: Text(
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: provider.isDark()
                                ? AppColors.whiteColor
                                : AppColors.blackDarkColor)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addTask();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: Theme.of(context).textTheme.titleLarge,
                      ))
                ],
          )),
        ],
      ),
    );
  }

  void addTask() {
    if (formKey.currentState!.validate()) {
      Task task = Task(title: title, description: desc, dateTime: selectedDate);
      Firebase.addTaskFirestore(task).timeout(Duration(seconds: 1),
          onTimeout: () {
        print('task added successfully ');
        providerList.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }
  }

  void showCalender() async {
    var choosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 356)));
    /* if(choosenDate!=null){
     selectedDate=choosenDate;
   }*/
    selectedDate = choosenDate ?? selectedDate;
    setState(() {});
  }
}

class ArgsEdit {
  String title;
  String description;

  ArgsEdit({required this.title, required this.description});
}