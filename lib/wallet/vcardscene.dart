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
              top: 120.0 * i,
              height: 180,
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

Widget _renderCard() {
  return new CreditCard(data: creditCardData);
}

List<Widget> _renderVCardList() {
  return new List<Widget>.generate(
      12,
      (i) => Positioned(
            top: 120.0 * i,
            left: 0.0,
            right: 0.0,
            height: 180,
            child: _renderCard(),
          ));
}

class VirtualCardScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            height: 12 * 120.0 + 60,
          ),
          ..._renderVCardList()
        ],
      ),
    );
  }
}
