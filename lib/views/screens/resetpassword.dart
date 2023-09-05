import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pixellery/views/screens/loginscreen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool notReset = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/resetpasswordbg.png',
                ),
                fit: BoxFit.cover)),
        child: Visibility(
          visible: notReset,
          replacement: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'PIXELLERY',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'StickNoBills',
                    fontSize: 40.sp,
                    letterSpacing: 15),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'An email has been sent to your account, enter the OTP(6 - digits) in the email.',
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 15.sp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: OTPTextField(
                  length: 6,
                  width: 330.w,
                  fieldWidth: 50.w,
                  style: TextStyle(fontSize: 17.sp),
                  otpFieldStyle: OtpFieldStyle(
                      backgroundColor: Colors.white,
                      borderColor: Colors.white,
                      focusBorderColor: Colors.white,
                      enabledBorderColor: Colors.white),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    debugPrint("Completed: $pin");
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.black, width: 1.5)),
                    fixedSize: Size(200.w, 40.h)),
                onPressed: () {
                  //Do what next
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.black, width: 1.5)),
                    fixedSize: Size(200.w, 40.h)),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                },
                child: Text(
                  'Back to Login Page',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'PIXELLERY',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'StickNoBills',
                    fontSize: 40.sp,
                    letterSpacing: 15),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'Forgot password? No worries, Enter your email to reset your password',
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 15.sp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: SizedBox(
                  height: 45.h,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter email',
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                      ),
                      contentPadding: const EdgeInsets.only(bottom: 4),
                      prefixIcon: const Icon(Icons.alternate_email),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.black, width: 1.5)),
                    fixedSize: Size(200.w, 40.h)),
                onPressed: () {
                  setState(() {
                    notReset = false;
                  });
                },
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Colors.black, width: 1.5)),
                    fixedSize: Size(200.w, 40.h)),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                },
                child: Text(
                  'Back to Login Page',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
