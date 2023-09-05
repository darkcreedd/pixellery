import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.icon,
      required this.obscureText});

  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).w,
      child: SizedBox(
        height: 45.h,
        child: TextFormField(
          cursorColor: Colors.black,
          style: TextStyle(fontSize: 14.sp),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14.sp),
            contentPadding: const EdgeInsets.only(bottom: 4).w,
            prefixIcon: Icon(
              icon,
              size: 24.sp,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20).r,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(20).r,
            ),
          ),
        ),
      ),
    );
  }
}
