import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pixellery/views/screens/loginscreen.dart';
import 'package:pixellery/views/widgets/custom_textfield.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/signupbg.png',
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
                Text(
                  'PIXELLERY',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'StickNoBills',
                      fontSize: 40.sp,
                      letterSpacing: 15),
                ),
                const CustomTextField(
                  hintText: "Enter Full Name",
                  icon: Icons.person_outlined,
                  obscureText: false,
                ),
                const CustomTextField(
                  hintText: "Enter email",
                  icon: Icons.alternate_email,
                  obscureText: false,
                ),
                const CustomTextField(
                  hintText: "Create password",
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const CustomTextField(
                  hintText: "Confirm password",
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Colors.black, width: 1.5)),
                      fixedSize: Size(150.w, 40.h)),
                  onPressed: () {},
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: Text(
                    'sign-up using',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.facebook,
                          color: Colors.black,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.google,
                          color: Colors.black,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.twitter,
                          color: Colors.black,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                    },
                    child: Text(
                      'Already have an account? Sign in',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 13.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
