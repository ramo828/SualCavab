// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sualcavab/my.dart';
import 'package:sualcavab/baza.dart';

bool themeStatus = true;
SualVeCavablar svc = SualVeCavablar();
myIcon mc = myIcon();
Tools t = Tools();
int verilenSual = t.yeniSual();
List<Widget> emr = [];
int sualSayi = svc.length() - 1;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeStatus ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Sual Cavab"),
        ),
        body: const appBody(),
      ),
    );
  }
}

// ignore: camel_case_types
class appBody extends StatefulWidget {
  const appBody({Key? key}) : super(key: key);
  @override
  State<appBody> createState() => _appBodyState();
}

// ignore: camel_case_types
class _appBodyState extends State<appBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                svc.getSual(verilenSual),
                style: const TextStyle(fontSize: 30, fontFamily: 'yazi'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Wrap(
              spacing: 15,
              runSpacing: 3,
              alignment: WrapAlignment.center,
              children: emr,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 80,
                  width: 160,
                  color: Colors.red,
                  child: FlatButton(
                    child: mc.successIcon,
                    onPressed: () {
                      setState(
                        () {
                          ControlQuestion(verilenSual, 1);
                          verilenSual = t.yeniSual();
                        },
                      );
                    },
                  ),
                ),
                Container(
                  height: 80,
                  width: 160,
                  color: Colors.red,
                  child: FlatButton(
                    child: mc.unsuccessIcon,
                    onPressed: () {
                      setState(
                        () {
                          ControlQuestion(verilenSual, 0);
                          verilenSual = t.yeniSual();
                        },
                      );
                    },
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

// ignore: non_constant_identifier_names
void ControlQuestion(int idx, int status) {
  status == 0
      ? !svc.getCavab(idx)
          ? emr.add(mc.dogruIcon)
          : emr.add(mc.yanlisIcon)
      : svc.getCavab(idx)
          ? emr.add(mc.dogruIcon)
          : emr.add(mc.yanlisIcon);
}
