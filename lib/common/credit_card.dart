import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final CreditCardViewModel data;

  const CreditCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/pics/card_blank_bg.jpeg'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: -100,
            bottom: -100,
            child: Image.asset(
              this.data.bankLogoUrl,
              width: 250,
              height: 250,
              color: Colors.white10,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        this.data.bankLogoUrl,
                        width: 36,
                        height: 36,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.data.nickName,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          this.data.budgetType,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(200, 255, 255, 255),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 65, top: 20),
                  child: Text(
                    this.data.cardId,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Farrington',
                      letterSpacing: 3,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 65, top: 15),
                  child: Text(
                    this.data.validDate,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreditCardViewModel {
  /// 银行Logo
  final String bankLogoUrl;

  /// 卡片颜色
  final List<Color> cardColors;

  /// 有效期
  final String validDate;

  final String nickName;
  final String cardOwner;
  final String vendor;

  final String budget;
  final String lastChargedOn;
  final String type;

  final String cardId;
  final String budgetId;
  final String status;
  final String budgetType;

  CreditCardViewModel(
      this.bankLogoUrl,
      this.cardColors,
      this.validDate,
      this.nickName,
      this.cardOwner,
      this.vendor,
      this.budget,
      this.lastChargedOn,
      this.type,
      this.cardId,
      this.budgetId,
      this.status,
      this.budgetType);

  CreditCardViewModel.fromJson(
    Map<String, dynamic> json,
  )   : nickName = json['nickName'],
        cardOwner = json['cardOwner'],
        vendor = json['vendor'],
        budget = json['budget'] ?? '',
        lastChargedOn = json['lastChargedOn'],
        type = json['type'],
        cardId = json['cardId'],
        budgetId = json['budgetId'] ?? '',
        status = json['status'],
        budgetType = json['budgetType'] ?? '',
        bankLogoUrl = 'assets/pics/bank_zs11.png',
        cardColors = [Color(0xFFF17B68), Color(0xFFE95F66)],
        validDate = 'CVV 10/27';
}
