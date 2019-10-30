import 'package:flutter/material.dart';
import 'package:macvon_flutter/common/credit_card.dart';
import 'package:macvon_flutter/wallet/mock_data.dart';


class PhysicalCardScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new CreditCard(data: creditCardData),
      ],
    );
  }
}
