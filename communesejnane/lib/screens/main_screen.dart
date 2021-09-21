import 'package:communesejnane/screens/agenda_screen.dart';
import 'package:communesejnane/screens/home_screen.dart';
import 'package:communesejnane/screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: <Widget>[
          HomeScreen(),
          AgendaPage(),
          NotificationPage(),
        ],
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            textAlign: TextAlign.left,
            icon: Icon(Icons.home),
            title: Text('Accueil'),
            activeColor: Color(0xFFB71C1C),
          ),
          BottomNavyBarItem(
            textAlign: TextAlign.left,
            icon: Icon(Icons.date_range),
            title: Text('Agenda'),
            activeColor: Color(0xFFB71C1C),
          ),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: Icon(Icons.notifications),
              title: Text('Notification'),
              activeColor: Color(0xFFB71C1C)),
        ],
      ),
    );
  }
}
