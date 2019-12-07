import 'package:flutter/material.dart';
import 'package:macvon_flutter/common/loading.dart';
import 'package:macvon_flutter/role_owner/more/morebody.dart';
import 'package:macvon_flutter/utils/Api.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> with AutomaticKeepAliveClientMixin {
  dynamic userinfo;

  @override
  void initState() {
    super.initState();
    _loadUserSetting();
    _loadAvatar();
  }

  _loadAvatar() async {
    await Api.getAvatar();
  }

  _loadUserSetting() async {
    var info = await Api.loadUserSetting();
    setState(() {
      userinfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (userinfo == null) return Loading();
    return MoreBody(userinfo);
  }

  @override
  bool get wantKeepAlive => true;
}
