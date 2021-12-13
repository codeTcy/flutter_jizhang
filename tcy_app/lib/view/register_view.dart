import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcy_app/base/bar_view.dart';
import 'package:tcy_app/viewmodel/register_viewmodel.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController _phone;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phone = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("注册"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: "请输入手机号",
                  hintMaxLines: 1,
                ),
                autofocus: true,
                controller: _phone,
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: CheckboxListTile(
                  contentPadding: EdgeInsets.all(3),
                  title: Text(
                    "已阅读并同意",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: Provider.of<RegisterViewModel>(context).getCheck,
                  onChanged: _setOnChange,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Provider.of<RegisterViewModel>(context).getCheck == true
                            ? Colors.blue
                            : Colors.grey,
                  ),
                  child: Text(
                    "注册",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  onPressed: _registerAction,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setOnChange(bool value) {
    context.read<RegisterViewModel>().setCheck(value);
  }

  void _registerAction() {
    if (context.read<RegisterViewModel>().getCheck == true) {
      context.read<RegisterViewModel>().register(_phone.text);
    } else {
      print("请点击同意");
    }
  }
}
