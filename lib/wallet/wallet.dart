import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macvon_flutter/common/indicator.dart';
import 'package:macvon_flutter/wallet/pcardscene.dart';
import 'package:macvon_flutter/wallet/vcardscene.dart';

class HeaderItemBean {
  final String labelTitle;
  HeaderItemBean(this.labelTitle);
}

final List<HeaderItemBean> _allPages = <HeaderItemBean>[
  new HeaderItemBean("physical card"),
  new HeaderItemBean("virtual card"),
];

class Wallet extends StatelessWidget {
  Widget _renderTabs() {
    return Material(
      color: Colors.white,
      child: new TabBar(
        isScrollable: true,
        indicator: YLStatisticsIndictor(),
        tabs: _allPages
            .map((HeaderItemBean page) => new Tab(
                    child: Text(
                  page.labelTitle,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )))
            .toList(),
      ),
    );
  }

  Widget _renderBody() {
    return new TabBarView(
      children: <Widget>[
        new PhysicalCardScene(),
        new VirtualCardScene(),
      ],
    );
  }

  Widget _renderHeader() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            'Wallet',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: _allPages.length,
        child: new Scaffold(
          appBar: new AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: new FlatButton(
                  child: new Text(
                    '+ BUDGET',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
            title: _renderHeader(),
          ),
          body: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: _renderTabs(),
                height: 30,
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                child: _renderBody(),
              )
            ],
          ),
        ));
  }
}