import 'package:flutter/widgets.dart';

class Gift with ChangeNotifier{
  final String title;
  final String description;
  final String image;
  final String id;

  Gift(
      {@required this.title, @required this.description, @required this.image,@required this.id});
}
