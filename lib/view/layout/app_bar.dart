import 'package:flutter/material.dart';
import 'package:ecommerce/res/app_url.dart';
import 'package:ecommerce/res/color.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget{
  final Color backgroundColor;

  const BaseAppBar({super.key,
  required this.backgroundColor,
  });

  @override

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppUrl.logoUrl,
            width: 100,
            height: 50,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 150.0,
            height: 30.0,
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGreenColor)),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 0),
                  hintText: 'Search here',
                  hintStyle: TextStyle(fontSize: 12.0)),
            ),
          )
        ],
      ),
    );
  }
}
