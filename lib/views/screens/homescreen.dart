import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:pixellery/views/screens/accountscreen.dart';
import 'package:pixellery/views/screens/browsephotosscreen.dart';
import 'package:pixellery/views/screens/favoritesscreen.dart';
import 'package:pixellery/views/screens/searchphotoscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    BrowsePhotosScreen(),
    SearchPage(),
    Favorites(),
    Account()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Pixellery',
            style: TextStyle(color: Colors.indigo, fontSize: 23.sp),
          ),
          backgroundColor: Colors.white),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  IcoFontIcons.world,
                  size: 24.sp,
                ),
                label: 'Browse'),
            BottomNavigationBarItem(
                icon: Icon(IcoFontIcons.search2, size: 24.sp), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, size: 24.sp), label: 'Saved'),
            BottomNavigationBarItem(
                icon: Icon(IcoFontIcons.userAlt1, size: 24.sp),
                label: 'Account')
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.grey.shade600,
          iconSize: 25.sp,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
