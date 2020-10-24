import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/main_bar/best_price_screen.dart';
import 'package:flutter_app2/screens/main_bar/gift_overview_screen.dart';
import 'package:flutter_app2/screens/main_bar/market_screen.dart';
import 'package:flutter_app2/screens/main_bar/profile_screen.dart';

class MainTapScreen extends StatefulWidget {
  @override
  _MainTapScreenState createState() => _MainTapScreenState();
}

class _MainTapScreenState extends State<MainTapScreen> {
  int _selectedPageIndex = 2;
  PageController _c = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _c,
        onPageChanged: (newPage) {
          setState(() {
            this._selectedPageIndex = newPage;
          });
        },
        children: [
          BestPriceScreen(),
          MarketScreen(),
          GiftOverviewScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          this._c.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        },
        elevation: 0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        //*
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(CupertinoIcons.tag_fill),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.work_outlined),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/giftActive.png'),
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            icon: Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/giftDeactive.png'),
                fit: BoxFit.cover,
              ),
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.person_rounded),
            title: Text(''),
          ),
        ],
      ),
    );
  }
}
