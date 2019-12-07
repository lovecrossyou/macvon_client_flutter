import 'package:flutter/material.dart';
import 'package:macvon_flutter/role_employee/wallet/components/card_info_item.dart';

Widget _renderCardInfo() {
  List<CardInfoModel> list = [
    new CardInfoModel('Card Number', '.... .... .... 4529'),
    new CardInfoModel('Card Holder', 'xing zhang'),
    new CardInfoModel(
        'Address', '101 Morgon lane Sutie 302 Planinsbort,NJ 08536'),
    new CardInfoModel('Exp.Date', '··/··'),
    new CardInfoModel('CVV', '···'),
  ];
  return Container(
    margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      separatorBuilder: (context, index) {
        return Container(
          height: .5,
          margin: EdgeInsets.symmetric(horizontal: 15),
          color: Color(0xFFDDDDDD),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return CardInfoItem(
          cardInfoModel: list[index],
        );
      },
    ),
  );
}


class CardInfo extends StatefulWidget {
  @override
  _CardInfoState createState() => _CardInfoState();
}

class _CardInfoState extends State<CardInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          HeaderTitle(),
          Container(
            child: _renderCardInfo(),
          )
        ],
      ),
    );
  }
}