import 'package:flutter/material.dart';
import 'package:macvon_flutter/common/credit_card.dart';
import 'package:macvon_flutter/common/loading.dart';
import 'package:macvon_flutter/utils/Api.dart';

class VirtualCardScene extends StatefulWidget {
  @override
  _VirtualCardSceneState createState() => _VirtualCardSceneState();
}

class _VirtualCardSceneState extends State<VirtualCardScene> {
  List cards;
  @override
  void initState() {
    super.initState();
    _loadPhysicalCards();
  }

  Widget _renderCard(dynamic physicalCard) {
    CreditCardViewModel creditCardViewModel =
        new CreditCardViewModel.fromJson(physicalCard);
    return new CreditCard(data: creditCardViewModel);
  }

  List<Widget> _renderVCardList() {
    return cards
        .asMap()
        .keys
        .map((index) => Positioned(
              top: 120.0 * index,
              left: 0.0,
              right: 0.0,
              height: 180,
              child: _renderCard(cards[index]),
            ))
        .toList();
  }

  List<Widget> _renderPage() {
    return <Widget>[
      Container(
        height: cards.length * 120.0 + 60,
      ),
      ..._renderVCardList()
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (cards == null) return Loading();
    return SingleChildScrollView(
      child: Stack(
        children: _renderPage(),
      ),
    );
  }

  void _loadPhysicalCards() async {
    var vCards = await Api.loadVCards();
    setState(() {
      cards = vCards;
    });
  }
}
