import 'package:flutter/material.dart';
import 'package:flutter_app2/models/gift.dart';

class GiftItem extends StatelessWidget {
  final Gift _gift;
  final bool isFirst;

  GiftItem(this._gift, this.isFirst);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isFirst
              ? Divider(
                  color: Colors.white10,
                )
              : Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30),
                child: Image.asset('assets/images/arrow.png',width: 25,height: 25,fit: BoxFit.fill,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _gift.title,
                          style: TextStyle(
                              fontFamily: 'Vazir', fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                        Text(_gift.description,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontFamily: 'Vazir'),),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 30),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(_gift.image),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
