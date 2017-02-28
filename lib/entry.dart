library entrymvc.pl_model;

import 'package:polymer/polymer_micro.dart';
import 'package:polymer/polymer.dart';

class Entry extends Object with JsProxy {
  @reflectable
  String title;

  @reflectable
  bool completed = false;

  Entry(this.title);

  Entry.fromJson(Map json)
      : title = json['title'], completed = json['completed'];

  Map toJson() => { 'title': title, 'completed': completed };

  String toString() => "$title (${completed ? '' : 'not '}done)";
}
