import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app2/screens/best_price_screen.dart';
import 'package:flutter_app2/screens/gift_overview_screen.dart';
import 'package:flutter_app2/screens/market_screen.dart';
import 'package:flutter_app2/screens/profile_screen.dart';

class MainTapScreen extends StatefulWidget {
  @override
  _MainTapScreenState createState() => _MainTapScreenState();
}

class _MainTapScreenState extends State<MainTapScreen> {
  int _selectedPageIndex = 2;
  PageController _pageController;
  bool _isBottomRequest = false;

  @override
  void initState() {
    _pageController = PageController(initialPage: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (newPage) {
          setState(() {
            if (!_isBottomRequest) {
              print('test');
              this._pageController.animateToPage(newPage,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.easeInOut);
            }
            this._selectedPageIndex = newPage;

            Timer(Duration(milliseconds: 50), () {
              _isBottomRequest = false;
            });
          });
        },
        dragStartBehavior: DragStartBehavior.start,
        children: [
          BestPriceScreen(),
          MarketScreen(),
          GiftOverviewScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          this._pageController.animateToPage(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut);
          _isBottomRequest = true;
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
