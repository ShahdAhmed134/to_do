import 'package:flutter/material.dart';
import 'package:to_do_app/app_colors.dart';

class AddListItem extends StatelessWidget {
  const AddListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            width: 4,
            height: 80,
            color: AppColors.primaryColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Title',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.primaryColor)),
                Text('Desc',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primaryColor,
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
