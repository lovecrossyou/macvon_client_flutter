import 'package:flutter/material.dart';
import 'package:macvon_flutter/common/credit_card.dart';
import 'package:macvon_flutter/wallet/mock_data.dart';

class VirtualCardList extends StatelessWidget {
  Widget _renderCard() {
    return new CreditCard(data: creditCardData);
  }

  List<Widget> _renderVCardList() {
    return new List<Widget>.generate(
        12,
        (i) => Positioned(
              top: 120.0 * i ,
              left: 0.0,
              right: 0.0,
              child: _renderCard(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _renderVCardList(),
    );
  }
}

class VirtualCardScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return VirtualCardList();
  }
}
