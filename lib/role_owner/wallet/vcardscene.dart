import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:macvon_flutter/common/credit_card.dart';
import 'package:macvon_flutter/stores/wallet.dart';

class VirtualCardScene extends StatefulWidget {
  @override
  _VirtualCardSceneState createState() => _VirtualCardSceneState();
}

class _VirtualCardSceneState extends State<VirtualCardScene> {
  @override
  void initState() {
    super.initState();
    _loadVCards();
  }

  Widget _renderCard(dynamic physicalCard) {
    CreditCardViewModel creditCardViewModel =
        new CreditCardViewModel.fromJson(physicalCard);
    return new CreditCard(data: creditCardViewModel);
  }

  List<Widget> _renderVCardList(List cards) {
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
    var cards = walletStore.vcards;
    return <Widget>[
      Container(
        height: cards.length * 120.0 + 60,
      ),
      ..._renderVCardList(cards)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SingleChildScrollView(
        child: Stack(
          children: _renderPage(),
        ),
      ),
    );
  }

  void _loadVCards() {
    walletStore.loadVCards();
  }
}
