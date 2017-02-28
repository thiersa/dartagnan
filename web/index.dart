library entrymvc.index;

import 'package:entrymvc/pl_input.dart';
import 'package:entrymvc/pl_item.dart';
import 'package:entrymvc/pl_entries.dart';
import 'package:entrymvc/entry.dart';
import 'package:polymer/init.dart';
import 'package:polymer/polymer.dart';
import 'dart:html';

main() async {
  await initPolymer();

print("hllalalal");
  querySelectorAll('.pl-item').onClick.listen((event) => print('click!'));
//querySelectorAll('h1').onClick.listen((event) => print('click!'));

// var subscription = elem.onClick.listen(
//    (event) => print('click!'));
//  subscription.cancel();

//sub.cancel();

}
