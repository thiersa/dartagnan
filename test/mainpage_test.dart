// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
@TestOn('browser')
library entrymvc.test.mainpage_test;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:test/test.dart';
import 'package:entrymvc/pl_entries.dart';

/**
 * This test runs the EntryMVC app and checks the state of the initial page.
 */
main() async {
  await initPolymer();

  EntryList entryList;

  setUp(() {
    entryList = Polymer.dom(document.body).querySelector('pl-entries');
  });

  tearDown(() {
    entryList.clear('items');
  });

  test('initial state', () {
    expect(entryList is EntryList, true, reason: 'EntryList should be created');

    final root = Polymer.dom(entryList.root);
    final newEntry = root.querySelector('#new-entry');
    expect(newEntry.placeholder, "What needs to be done?");

    // Validate a style got applied
    var color = root.querySelector('#footer').getComputedStyle().color;
    expect(color, 'rgb(119, 119, 119)');

    expect(entryList.items, [], reason: 'no items yet');
  });
}
