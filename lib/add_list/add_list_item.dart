import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/Edit/edit_task.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/firebase.dart';
import 'package:to_do_app/model/task.dart';

import '../provider/app_config_provider.dart';
import '../provider/provider_list.dart';

class AddListItem extends StatefulWidget {
  Task task;

  AddListItem({required this.task});

  @override
  State<AddListItem> createState() => _AddListItemState();
}

class _AddListItemState extends State<AddListItem> {
  bool isTaskDone = false;
  late ProviderList providerList;
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    providerList = Provider.of<ProviderList>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.25,
          // A motion is a widget used to control how the pane animates.
          motion: const BehindMotion(),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) {
                Firebase.deleteTaskFromFireStore(widget.task)
                    .timeout(Duration(seconds: 1), onTimeout: () {
                  print('task deleted');
                });
                providerList.getAllTasksFromFireStore();
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTask(task: widget.task),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: provider.isDark()
                    ? AppColors.blackDarkColor
                    : AppColors.whiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 25, 20, 25),
                  width: 4,
                  height: 70,
                  color: isTaskDone
                      ? AppColors.greenColor
                      : AppColors.primaryColor,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(widget.task.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: isTaskDone
                                      ? AppColors.greenColor
                                      : AppColors.primaryColor,
                                  fontSize: 22)),
                      Text(widget.task.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                isTaskDone
                    ? Container(
                        margin: EdgeInsets.all(10),
                        child: Text('Done!',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColors.greenColor)),
                      )
                    : Container(
                        margin: EdgeInsets.all(10),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.primaryColor,
                        ),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                isTaskDone = true;
                              });
                            },
                            child: Icon(
                              Icons.check,
                              size: 33,
                              color: Colors.white,
                            )),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
