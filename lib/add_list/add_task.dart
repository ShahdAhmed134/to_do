import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';

class AddTaskBottomSheet extends StatelessWidget {
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
              child: Column(
            children: [
              TextFormField(
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
                decoration: InputDecoration(
                  hintText: 'enter task details',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.grayColor),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
