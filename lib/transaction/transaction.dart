import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macvon_flutter/wallet/pcardscene.dart';
import 'package:macvon_flutter/wallet/vcardscene.dart';

class HeaderItemBean {
  final String labelTitle;
  HeaderItemBean(this.labelTitle);
}

final List<HeaderItemBean> _allPages = <HeaderItemBean>[
  new HeaderItemBean("your transactions"),
  new HeaderItemBean("all transactions"),
];

class Transaction extends StatelessWidget {
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
            'Transaction',
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

class YLStatisticsIndictor extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return _YLIndictorPainter();
  }
}

class _YLIndictorPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = Color(0xff376BD1);
    paint.style = PaintingStyle.fill;
    final w = 24.0;
    final h = 2.5;
    canvas.drawRect(
        Rect.fromLTWH(offset.dx + 16, configuration.size.height - h, w, h),
        paint);
  }
}
