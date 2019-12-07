import 'package:flutter/material.dart';
import 'package:macvon_flutter/stores/signin.dart';

String horseUrl = 'https://i.stack.imgur.com/Dw6f7.png';
String cowUrl = 'https://i.stack.imgur.com/XPOr3.png';
String camelUrl = 'https://i.stack.imgur.com/YN0m7.png';
String sheepUrl = 'https://i.stack.imgur.com/wKzo8.png';
String goatUrl = 'https://i.stack.imgur.com/Qt4JP.png';

class MoreBody extends StatelessWidget {
  final dynamic userinfo;
  MoreBody(this.userinfo);

  Widget _rendetAvatar() {
    var avatarInfo = signInStore.avatarInfo;
    if (avatarInfo == null) return Image.asset('assets/pics/bank_zs.png');
    return Image.network(signInStore.avatarInfo['value']);
  }

  Widget _renderHeader() {
    return ListTile(
      leading: Container(
        child: this._rendetAvatar(),
      ),
      title: Text(
        '${userinfo['firstName']} ${userinfo['lastName']}',
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(
        '${userinfo['email']}',
        style: TextStyle(color: Colors.black38),
      ),
      trailing: Icon(Icons.edit),
      onTap: () {},
      selected: true,
      contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
    );
  }

  Widget _renderBotCard(context) {
    return new SizedBox(
      child: new Card(
        child: new Column(
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              title: new Text('Login options',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: Image.asset(
                'assets/more/more_icon_sendfunds.png',
                width: 30,
                height: 30,
              ),
            ),
            new Divider(),
            new ListTile(
              onTap: () => {Navigator.pushReplacementNamed(context, '/signin')},
              title: new Text('Logout',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: Image.asset(
                'assets/more/more_icon_logout.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderCenterCard() {
    return new SizedBox(
      child: new Card(
        child: new Column(
          // card只能有一个widget，但这个widget内容可以包含其他的widget
          children: [
            new ListTile(
              title: new Text('Send funds',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: Image.asset(
                'assets/more/funds.png',
                width: 30,
                height: 30,
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text('Requests',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: Image.asset(
                'assets/more/more_icon_requests.png',
                width: 30,
                height: 30,
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text('Alerts',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: Image.asset(
                'assets/more/more_icon_alerts.png',
                width: 30,
                height: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _renderHeader(),
        _renderCenterCard(),
        _renderBotCard(context),
      ],
    );
  }
}
