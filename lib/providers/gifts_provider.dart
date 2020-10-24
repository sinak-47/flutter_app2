import 'package:flutter/foundation.dart';
import 'package:flutter_app2/dummy_data.dart';
import 'package:flutter_app2/models/gift.dart';

class GiftsProvider with ChangeNotifier {
  List<Gift> _giftsList = DUMMY_GIFTS;

  List<Gift> get giftsList {
    return [..._giftsList];
  }

  void addGift (Gift gift)
  {
    _giftsList.add(gift);
    notifyListeners();
  }

  int get itemCount {
    return _giftsList.length;
  }
}
