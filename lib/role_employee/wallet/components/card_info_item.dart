import 'package:flutter/material.dart';

class CardInfoModel {
  final String title;
  final String value;

  CardInfoModel(this.title, this.value);
}

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
