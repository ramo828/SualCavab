import 'package:flutter/material.dart';
import 'dart:math';
import 'baza.dart';

// ignore: camel_case_types
class myIcon {
  Icon dogruIcon = const Icon(Icons.mood_rounded, color: Colors.green);
  Icon yanlisIcon = const Icon(Icons.mood_bad_rounded, color: Colors.red);

  Icon successIcon = const Icon(
    Icons.thumb_up,
    size: 80,
    color: Colors.white,
  );
  Icon unsuccessIcon = const Icon(
    Icons.thumb_down,
    size: 80,
    color: Colors.white,
  );
}

class Tools {
  List<int> verilenSonSualID = [];
  SualVeCavablar svc = SualVeCavablar();
  int counter = 0;
  int yeniSual() {
    int qid = Random().nextInt(svc.length() - 1);
    counter++;
    // ignore: avoid_print
    if (counter == svc.length()) print("son");
    if (!verilenSonSualID.contains(qid)) {
      verilenSonSualID.add(qid);
      return qid;
    } else {
      return yeniSual();
    }
  }
}

class Sual {
  String sual;
  bool cavab;
  Sual({required this.sual, required this.cavab});
}
