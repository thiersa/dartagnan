@HtmlImport('pl_entries.html')
library entrymvc.pl_entries;

import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'pl_input.dart';
import 'pl_item.dart';
import 'entry.dart';

@PolymerRegister('pl-entries')
class EntryList extends PolymerElement {
  @Property(observer: 'itemsChanged')
  List<Entry> items;

  @Property(observer: 'storageIdChanged')
  String storageId = 'storage';

  @Property(computed: 'countCompleted(items.*)')
  int completedCount;

  @Property(computed: 'countActive(items.*)')
  int activeCount;

  @Property(computed: 'getActiveItemWord(activeCount)')
  String activeItemWord;

  @Property(observer: 'filterChanged')
  String filter = window.location.hash.replaceFirst('#', '');

  Storage storage = window.localStorage;

  final filters = {
    'active': (item) => !item.completed,
    'completed': (item) => item.completed,
  };

  factory EntryList() => new Element.tag('pl-entries');
  EntryList.created() : super.created();

  ready() {
    window.onHashChange.listen((_) {
      set('filter', window.location.hash.replaceFirst('#', ''));
    });
  }

  EntryInput get _newEntry => $['new-entry'];

  @reflectable
  bool isNotEmpty(value) => value == null ? false : value.isNotEmpty;

  @reflectable
  bool isZero(int value, [_]) => value == 0;

  @reflectable
  void addEntryAction([_, __]) {
    newItem(_newEntry.value);
    _newEntry.value = '';
  }

  @reflectable
  void cancelAddEntryAction([_, __]) {
    _newEntry.value = '';
  }

  @reflectable
  void destroyItemAction(e, [_]) {
    destroyItem(e.detail);
  }

  @reflectable
  void toggleAllCompletedAction(e, [_]) {
    setItemsCompleted(e.target.checked);
  }

  @reflectable
  void clearCompletedAction([_, __]) {
    clearItems();
  }

  @reflectable
  int countActive([_, __]) =>
      items == null ? 0 : items.where(filters['active']).length;

  @reflectable
  int countCompleted([_, __]) =>
      items == null ? 0 : items.where(filters['completed']).length;

  @reflectable
  bool checkAllCompleted(int completedCount, int activeCount) =>
      completedCount > 0 && activeCount == 0;

  @reflectable
  String getActiveItemWord(int activeCount) =>
      activeCount == 1 ? 'item' : 'items';

  @Observe('items.*')
  void itemsChanged([_, __]) {
    if (storageId != null && items != null) {
      storage[storageId] = JSON.encode(items);
    }
  }

  @reflectable
  void storageIdChanged([_, __]) {
    _setItems();
  }

  @reflectable
  filterChanged([_, __]) {
    ($['entry-repeat'] as DomRepeat).render();
    window.location.hash = filter;
    for (Element li in $['filters'].querySelectorAll('li')) {
      if (li.attributes['label'] == filter) {
        li.classes.add('selected');
      } else {
        li.classes.remove('selected');
      }
    }
  }

  @reflectable
  void filterAction(e, [_]) {
    if (e.target is! AnchorElement) return;
    var target = e.target as AnchorElement;
    set('filter', target.parent.attributes['label']);
  }

  void _setItems() {
    if (storage[storageId] == null) {
      set('items', []);
    } else {
      set('items', JSON.decode(
          storage[storageId]).map((i) => new Entry.fromJson(i)).toList());
    }
  }

  @reflectable
  bool itemsFilter(Entry item) {
    var filterFn = filters[filter];
    return filterFn != null ? filterFn(item) : true;
  }

  void newItem(String title) {
    title = title.trim();
    if (title != '') {
      add('items', new Entry(title));
    }
  }

  void destroyItem(Entry item) {
    removeItem('items', item);
  }

  void clearItems() {
    removeWhere('items', filters['completed']);
  }

  void setItemsCompleted(bool completed) {
    for (var i = 0; i < items.length; i++) {
      set('items.$i.completed', completed);
    }
  }
}
