import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/firebase.dart';
import 'package:to_do_app/provider/provider_list.dart';
import 'package:to_do_app/task.dart';

import '../provider/app_config_provider.dart';

/*
class EditTask extends StatefulWidget {
  static const String routeName = 'edit';
Task task;
EditTask({required this.task});
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override  var selectedDate = DateTime.now();
  Widget build(BuildContext context) {


   var provider = Provider.of<AppConfigProvider>(context);
    var providerList = Provider.of<ProviderList>(context);
   var formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
            child: Text(
              "To Do List",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        ),
        body: Stack(
alignment: Alignment.topCenter,
            children:[
              Container(
            width: double.infinity,
            height: 60,
            color: AppColors.primaryColor,
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20) ,color: AppColors.whiteColor,
            ),
            width: MediaQuery.of(context).size.width*0.9,
            height:  MediaQuery.of(context).size.height*0.7,
            child:Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.edit,
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
                           // title = text;
                          },
                          decoration: InputDecoration(
                            hintText:
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
                            //desc = text;
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
                              //addTask();
                            },
                            child: Text(
                              AppLocalizations.of(context)!.add,
                              style: Theme.of(context).textTheme.titleLarge,
                            ))
                      ],
                    )),
              ],
            ),
          )
          ]
        ));
  }
void showCalender() async {
    var choosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 356)));
    */
/* if(choosenDate!=null){
     selectedDate=choosenDate;
   }*/
/*

    selectedDate = choosenDate ?? selectedDate;
    setState(() {});
  }}
*/
class EditTask extends StatefulWidget {
  static const String routeName = 'edit';
  final Task task; // Task data passed to the EditTask widget

  EditTask({required this.task});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.task.title,
    );
    descriptionController =
        TextEditingController(text: widget.task.description);
    selectedDate = widget.task.dateTime;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var providerList = Provider.of<ProviderList>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
          child: Text(
            "To Do List",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      ),
      body: Stack(alignment: Alignment.topCenter, children: [
        Container(
          width: double.infinity,
          height: 60,
          color: AppColors.primaryColor,
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: provider.isDark()
                ? AppColors.blackDarkColor
                : AppColors.whiteColor,
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.edit,
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
                        controller: titleController, // Set initial value
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter task title';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.task_title,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Color(0xffb2aeae)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: descriptionController, // Set initial value
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter task details';
                          }
                          return null;
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
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: provider.isDark()
                                        ? AppColors.whiteColor
                                        : AppColors.blackDarkColor)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            updateTask();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.edit,
                            style: Theme.of(context).textTheme.titleLarge,
                          ))
                    ],
                  )),
            ],
          ),
        )
      ]),
    );
  }

  void showCalender() async {
    var choosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 356)),
    );

    selectedDate = choosenDate ?? selectedDate;
    setState(() {});
  }

  void updateTask() {
    if (formKey.currentState!.validate()) {
      widget.task.title = titleController.text;
      widget.task.description = descriptionController.text;
      widget.task.dateTime = selectedDate;
      Firebase.updateTaskFirestore(widget.task).timeout(Duration(seconds: 1),
          onTimeout: () {
        print('Task updated successfully');
        Navigator.pop(context);
      });
    }
  }
}
