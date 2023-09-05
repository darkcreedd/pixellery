import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AccountTiles extends StatelessWidget {
  AccountTiles(
      {super.key, required this.title, required this.leadingIcon, this.onTap});
  String title;
  IconData leadingIcon;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).w,
      child: Container(
        height: 63.h,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.indigo, width: 2),
          borderRadius: BorderRadius.circular(30).r,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 17.0).w,
              child: Icon(
                leadingIcon,
                size: 24.sp,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 8, 8, 8).w,
              child: Text(
                title,
                style: TextStyle(fontSize: 14.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
