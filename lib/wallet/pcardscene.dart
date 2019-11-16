import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:macvon_flutter/common/credit_card.dart';
import 'package:macvon_flutter/transaction/transactionlist.dart';
import 'package:macvon_flutter/utils/Api.dart';
import 'package:macvon_flutter/wallet/components/card_info_item.dart';

Widget _renderCardInfo(dynamic cardInfoModel) {
  List<CardInfoModel> list = [
    new CardInfoModel('Card Number', "${cardInfoModel['cardId']}"),
    new CardInfoModel('Card Holder', "${cardInfoModel['cardHolder']}"),
    new CardInfoModel('Address', "${cardInfoModel['address']}"),
    new CardInfoModel('Exp.Date', "${cardInfoModel['expiration']}"),
    new CardInfoModel('CVC', "${cardInfoModel['cvc']}"),
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
  final cardInfoModel;

  CardInfo(this.cardInfoModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          HeaderTitle(),
          Container(
            child: _renderCardInfo(cardInfoModel),
          )
        ],
      ),
    );
  }
}

class PhysicalCardScene extends StatefulWidget {
  @override
  _PhysicalCardSceneState createState() => _PhysicalCardSceneState();
}

class _PhysicalCardSceneState extends State<PhysicalCardScene> {
  List cards;
  CreditCardViewModel physicalCard;
  dynamic physicalCardInfo;
  @override
  void initState() {
    super.initState();
    _loadPhysicalCards();
  }

  List<Widget> _renderPage() {
    return <Widget>[
      new CreditCard(data: physicalCard),
      new CardInfo(physicalCardInfo),
      new TransactionList()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      shrinkWrap: true,
      children: cards != null ? _renderPage() : _loading(),
    );
  }

  //预加载布局
  List<Widget> _loading() {
    return <Widget>[
      new Container(
        height: 300.0,
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            new Text("loading.."),
          ],
        )),
      )
    ];
  }

  void _loadPhysicalCards() async {
    var allCards = await Api.loadAllCards();
    var physicalCardInfoJson = await Api.loadPhysicalCard();
    print('${physicalCardInfoJson.toString()}');


    setState(() {
      cards = allCards;
      physicalCard = new CreditCardViewModel.fromJson(allCards.first);
      physicalCardInfo = physicalCardInfoJson;
    });
  }
}
