import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixellery/dataclass/dataclass.dart';
import 'package:pixellery/views/screens/loginscreen.dart';
import 'package:provider/provider.dart';

main() => runApp(
      ChangeNotifierProvider(
        create: (context) => DataClass(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: const Login(),
      ),
    );
  }
}
