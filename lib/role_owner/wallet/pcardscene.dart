import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:macvon_flutter/common/credit_card.dart';
import 'package:macvon_flutter/common/loading.dart';
import 'package:macvon_flutter/role_owner/wallet/components/card_info_item.dart';
import 'package:macvon_flutter/stores/transaction.dart';
import 'package:macvon_flutter/stores/wallet.dart';

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
  @override
  void initState() {
    super.initState();
    walletStore.loadPhysicalCardInfo();
    walletStore.loadPhysicalCard();
  }

  List<Widget> _renderPage(physicalCard, physicalCardInfo, txns) {
    if (physicalCard == null) return <Widget>[Loading()];
    if (physicalCardInfo == null) return <Widget>[Loading()];
    return <Widget>[
      new CreditCard(data: physicalCard),
      new CardInfo(physicalCardInfo),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView(
        shrinkWrap: true,
        children: _renderPage(walletStore.physicalCard,
            walletStore.physicalCardInfo, txnStore.txns),
      ),
    );
  }
}
