import 'package:flutter/material.dart';
import 'package:macvon_flutter/budget/select_budget.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _name;

  String _password;

  void _forSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      print(_name);
      print(_password);
    }
  }

  _selectBudget(context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SelectBudget();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter data',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ADD CARD'),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _forSubmitted,
          child: new Text('提交'),
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.all(16.0),
              child: new Form(
                key: _formKey,
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                        labelText: 'Enter card name',
                      ),
                      obscureText: true,
                      validator: (val) {
                        return val.length < 4
                            ? "card name less than 4 letter"
                            : null;
                      },
                      onSaved: (val) {
                        _password = val;
                      },
                    ),
                  ],
                ),
              ),
            ),
            new ListTile(
              onTap: () {
                this._selectBudget(context);
              },
              leading: FlutterLogo(size: 28.0),
              title: Text('BUDGET'),
              trailing: Container(
                  width: 110,
                  child: Row(
                    children: <Widget>[
                      Text('Selet a budget'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
