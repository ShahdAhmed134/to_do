import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'add new Task',
            style: Theme.of(context).textTheme.titleMedium,
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
                    decoration: InputDecoration(
                  hintText: 'enter task title',
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
                    decoration: InputDecoration(
                  hintText: 'enter task details',
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
                    'Select Date',
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
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addTask();
                      },
                      child: Text(
                        'Add',
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
      /// add task
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
