import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pixellery/dataclass/dataclass.dart';
import 'package:pixellery/views/screens/homescreen.dart';
import 'package:pixellery/views/screens/resetpassword.dart';
import 'package:pixellery/views/screens/signupscreen.dart';
import 'package:pixellery/views/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    var dataclass = Provider.of<DataClass>(context, listen: false);
    dataclass.shared = dataclass.fetchPictures(dataclass.pageNumber);

    super.initState();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool incorrect = false;
  bool keepMeLoggedIn = false;
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
                      'assets/images/loginbg.png',
                    ),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome back to ',
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
                Visibility(
                  visible: incorrect,
                  child: Text(
                    'Incorrect email or password',
                    style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        fontSize: 14.sp),
                  ),
                ),
                CustomTextField(
                  controller: email,
                  hintText: "Enter email",
                  icon: Icons.email_outlined,
                  obscureText: false,
                ),
                CustomTextField(
                  controller: password,
                  hintText: "Enter password",
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, right: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ResetPassword(),
                                  ));
                            },
                            child: Text(
                              'forgot password?',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                            )),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Colors.black, width: 1.5)),
                      fixedSize: const Size(150, 40)),
                  onPressed: () {
                    if (email.text == 'darkcreedd' &&
                        password.text == 'testhere') {
                      setState(() {
                        incorrect = false;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    } else {
                      setState(() {
                        incorrect = true;
                      });
                    }
                  },
                  child: Text(
                    'Login',
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'sign-in with',
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
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ));
                    },
                    child: Text(
                      'New Here? Sign up',
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
