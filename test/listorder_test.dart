// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
@TestOn('browser')
library entrymvc.test.listorder_test;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:test/test.dart';
import 'package:entrymvc/pl_entries.dart';
import 'package:entrymvc/entry.dart';

/**
 * This test runs the EntryMVC app, adds a few elements, marks some as done, and
 * switches from back and forth between "Active" and "All". This will make some
 * nodes to be hidden and readded to the page.
 */
main() async {
  await initPolymer();

  PolymerDom root;
  EntryList entryList;

  setUp(() {
    entryList = Polymer.dom(document.body).querySelector('pl-entries');
    root = Polymer.dom(entryList.root);
  });

  test('programmatically add items to model', () {
    entryList.addAll('items', [
      new Entry('one (unchecked)'),
      new Entry('two (checked)')..completed = true,
      new Entry('three (unchecked)')
    ]);
    return window.animationFrame.then((_) {
      expect(root.querySelectorAll('#entry-list li[is=pl-item]').length, 3);

      for (var a in root.querySelectorAll('#filters > li > a')) {
        a.href = '#${Uri.parse(a.href).fragment}';
      }
    });
  });

  test('navigate to #active', () {
    window.location.hash = 'active';
    return window.animationFrame.then((_) {
      expect(root.querySelectorAll('#entry-list li[is=pl-item]').length, 2);
    });
  });

  test('navigate to #completed', () {
    window.location.hash = 'completed';
    return window.animationFrame.then((_) {
      expect(root.querySelectorAll('#entry-list li[is=pl-item]').length, 1);
    });
  });

  test('navigate back to #', () {
    window.location.hash = '';
    return window.animationFrame.then((_) {
      expect(root.querySelectorAll('#entry-list li[is=pl-item]').length, 3);
      entryList.clear('items');
    });
  });
}
