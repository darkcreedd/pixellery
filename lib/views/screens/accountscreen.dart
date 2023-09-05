import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:pixellery/views/screens/loginscreen.dart';
import 'package:pixellery/views/widgets/account_tiles.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(10.0).w,
      child: SingleChildScrollView(
        child: SizedBox(
          // height: 500.h,
          width: MediaQuery.of(context).size.width,
          child: Material(
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            borderRadius: BorderRadius.circular(20).r,
            color: Colors.white,
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: const BoxDecoration(color: Colors.indigo),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.black,
                    foregroundImage: const AssetImage('assets/images/user.jpg'),
                    radius: 100.w,
                    // backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  accountName: Text(
                    'Darkcreedd',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  accountEmail: Text(
                    'darkcreedd@gmail.com',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                AccountTiles(
                  title: 'Edit Profile',
                  leadingIcon: IcoFontIcons.editAlt,
                ),
                AccountTiles(
                  title: 'Language',
                  leadingIcon: Icons.language,
                ),
                GestureDetector(
                  onTap: () {
                    showAboutDialog(
                        context: context,
                        applicationIcon: const CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 50,
                            foregroundImage:
                                AssetImage('assets/icons/ic_launcher.png')),
                        applicationName: 'Pixellery',
                        applicationVersion: '1.0.0v');
                  },
                  child: AccountTiles(
                    title: 'About App',
                    leadingIcon: IcoFontIcons.info,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                size: 24.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0).w,
                                child: Text(
                                  'Log out?',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                            ],
                          ),
                          content: Text('We are sad to see you leave',
                              style: TextStyle(fontSize: 14.sp)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Login(),
                                    ));
                              },
                              child: Text(
                                'Leave',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Stay',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: AccountTiles(
                    title: 'Logout',
                    leadingIcon: IcoFontIcons.logout,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
