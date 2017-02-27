// Copyright (c) 2017, mo. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:polymer/polymer.dart';

void main() async {
  await initPolymer();
  querySelector('#output').text = 'Your Dart app is running.';

}
