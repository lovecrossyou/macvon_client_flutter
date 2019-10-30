import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderItemBean {
  final String labelTitle;
  HeaderItemBean(this.labelTitle);
}

final List<HeaderItemBean> _allPages = <HeaderItemBean>[
  new HeaderItemBean("physical card"),
  new HeaderItemBean("virtual card"),
];

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleLayout = new TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.only(right: 16),
      indicator: YLStatisticsIndictor(),
      tabs: _allPages
          .map((HeaderItemBean page) => new Tab(
                  child: Text(
                page.labelTitle,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )))
          .toList(),
    );

    Widget body = new TabBarView(
        children: _allPages.map((HeaderItemBean page) {
      return Center(
        child: Container(
          child: Text(page.labelTitle),
        ),
      );
    }).toList());

    Widget header = Row(
      children: <Widget>[
        Expanded(
          child: Text('Wallet'),
        ),
      ],
    );

    return new DefaultTabController(
        length: _allPages.length,
        child: new Scaffold(
          appBar: new AppBar(
            centerTitle: false,
            // backgroundColor: Color,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child:Icon(Icons.add),
              ),
            ],
            title: header,
          ),
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 16),
                child: titleLayout,
                height: 30,
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                child: body,
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
        Rect.fromLTWH(offset.dx, configuration.size.height - h, w, h), paint);
  }
}
