import 'package:flutter/material.dart';
import 'package:flutter_app2/providers/gifts_provider.dart';
import 'package:flutter_app2/widgets/gift_item.dart';
import 'package:provider/provider.dart';

class GiftOverviewScreen extends StatelessWidget {
  static const ROUTE_NAME = '/gift_overview';

  @override
  Widget build(BuildContext context) {
    final giftsData = Provider.of<GiftsProvider>(context);
    final gifts = giftsData.giftsList;

    // Row(
    //   children: [
    //     Row(
    //       children: [
    //         Text(
    //           '۷۲۲',
    //           style: TextStyle(fontFamily: 'Vazir'),
    //         ),
    //         // Container(
    //         //   padding: EdgeInsets.only(right: 10),
    //         //   child: CircleAvatar(
    //         //     radius: 25,
    //         //     backgroundImage: AssetImage('assets/images/coin.png'),
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //     Text(
    //       'کوپن خرید',
    //       style: TextStyle(fontFamily: 'Vazir'),
    //     ),
    //   ],
    // ),

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        shadowColor: Color.fromRGBO(0, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/images/coin.png'),
                    ),
                  ),
                  Text(
                    '۷۲۲',
                    style: TextStyle(fontFamily: 'Vazir', color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Text(
                'کوپن خرید',
                style: TextStyle(fontFamily: 'Vazir', color: Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: gifts.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: gifts[i],
          child: GiftItem(gifts[i], i == 0),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      ),
    );
  }
}
