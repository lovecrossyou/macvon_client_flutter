import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:macvon_flutter/common/credit_card.dart';
import 'package:macvon_flutter/transaction/transactionlist.dart';
import 'package:macvon_flutter/wallet/mock_data.dart';


class HeaderTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.blue,
            margin: EdgeInsets.only(right: 4),
            width: 4,
            height: 13,
          ),
          Expanded(
            child: Text('CARD INFORMATION',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}

class CardInfoModel {
  final String title;
  final String value;

  CardInfoModel(this.title, this.value);
}

class CardInfoItem extends StatelessWidget {
  final CardInfoModel cardInfoModel;

  const CardInfoItem({Key key, @required this.cardInfoModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: <Widget>[
          Container(
            width: 90,
            margin: EdgeInsets.only(right: 6),
            child: Text(this.cardInfoModel.title,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 14)),
          ),
          Expanded(
              child: Text(this.cardInfoModel.value,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 16))),
        ],
      ),
    );
  }
}

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

class CardInfo extends StatelessWidget {
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

class PhysicalCardScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      shrinkWrap: true,
      children: <Widget>[
        new CreditCard(data: creditCardData),
        new CardInfo(),
        new TransactionList()
      ],
    );
  }
}
