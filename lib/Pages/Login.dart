import 'package:community/Api/Api.dart';
import 'package:community/Common/ConstString.dart';
import 'package:community/Common/Routes.dart';
import 'package:community/Common/Util.dart';
import 'package:community/Widget/ProgressDialog/IProgressDialog.dart';
import 'package:community/Widget/ProgressDialog/ProgressDialog.dart';
import 'package:community/generated/i18n.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Function(bool tf) notifyParent;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map<String, dynamic> loginInfo;
  bool isLoding = false;
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      Util.sharedPreferences = prefs;
      prefs.remove(ConstString.token);
      print(Util.sharedPreferences.get(ConstString.token));
      if (Util.sharedPreferences.get(ConstString.token) != null) {
        Navigator.pushReplacementNamed(context, Routes.index);
      }
    });
    loginInfo = {'Email': '', 'Password': ''};
  }

  void login() async {
    print('loginInfo:$loginInfo');
    setState(() {
      // isLoding = true;
      this.widget.notifyParent(true);
    });
    var res = await Api.login(loginInfo);
    if (res.success) {
      Util.sharedPreferences.setString(ConstString.token, res.data);
      print(
          "ConstString.token:" + Util.sharedPreferences.get(ConstString.token));
      Navigator.pushReplacementNamed(context, Routes.index);
    } else {
      Fluttertoast.showToast(
          msg: res.msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    setState(() {
      // isLoding = false;
      // this.widget.progressDialog.loading.value = false;
      this.widget.notifyParent(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var app = Scaffold(
      appBar: AppBar(
        title: Text(I18n.of(context).Login),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            // height: 500,double.infinity
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 50.0),
            decoration: new BoxDecoration(),
            child: Container(
              decoration: new BoxDecoration(
                color: Colors.lightBlueAccent,
                border: new Border.all(color: Colors.blueGrey, width: 5),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Logo',
                      style: TextStyle(
                        fontSize: 60,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          child: Text(
                            'Email',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        new SizedBox(
                          //Flexible
                          width: 100,
                          child: new TextField(
                            style: new TextStyle(
                              fontSize: 20.0,
                              // height: 2.0,
                              color: Colors.black,
                            ),
                            controller:
                                TextEditingController(text: loginInfo['Email']),
                            onChanged: (value) {
                              loginInfo['Email'] = value;
                            },
                            decoration: const InputDecoration(
                              // helperText: "Enter App ID",
                              fillColor: Colors.red,
                            ),
                            // style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          child: Text(
                            'Password',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        new SizedBox(
                          //Flexible
                          width: 100,
                          child: new TextField(
                            controller: TextEditingController(
                                text: loginInfo['Password']),
                            onChanged: (value) {
                              loginInfo['Password'] = value;
                            },
                            obscureText: true,
                            style: new TextStyle(
                              fontSize: 20.0,
                              // height: 2.0,
                              color: Colors.black,
                            ),
                            decoration: const InputDecoration(
                              // helperText: "Enter App ID",
                              fillColor: Colors.red,
                            ),
                            // style: Theme.of(context).textTheme.body1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        color: Theme.of(context).colorScheme.background,
                        onPressed: login,
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          I18n.of(context).Login,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    List<Widget> widgetList = [];
    widgetList.add(app);
    if (isLoding) {
      widgetList.add(
        Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              color: Colors.black87,
            )),
      );
      widgetList.add(Center(
        child: CircularProgressIndicator(),
      ));
    }
    return Stack(
      children: widgetList,
    );
    // return app;
  }
}
