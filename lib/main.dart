import 'package:flutter/material.dart';
import 'package:flutter_app2/providers/gifts_provider.dart';
import 'package:flutter_app2/screens/best_price_screen.dart';
import 'package:flutter_app2/screens/gift_overview_screen.dart';
import 'package:flutter_app2/screens/main_tap_screen.dart';
import 'package:flutter_app2/screens/market_screen.dart';
import 'package:flutter_app2/screens/profile_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GiftsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainTapScreen(),
        routes: {
          BestPriceScreen.ROUTE_NAME: (ctx) => BestPriceScreen(),
          ProfileScreen.ROUTE_NAME: (ctx) => ProfileScreen(),
          MarketScreen.ROUTE_NAME: (ctx) => MarketScreen(),
          GiftOverviewScreen.ROUTE_NAME: (ctx) => GiftOverviewScreen(),
        },
      ),
    );
  }
}
