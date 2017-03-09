class Locker {
  Map<String,int> items;
  List<LockerEntry> storage;

  Locker() {
    items = new Map<String,int>();
    storage = new List<LockerEntry>();
  }

  Locker.fromMap(Map<String, LockerEntry> entries) {

    items = new Map<String,int>();
    storage = new List<LockerEntry>();

    entries.forEach((name, le) => this.add(name, le));
  }

  int add(String name, LockerEntry le) {
    int index = storage.length;
    storage.add(le);
    items[name] = index;
    print("$name: $index");
    print(le.getContent());
    return index;
  }

  int storageLocation(String name) {
    int index = -1;
    if (items.containsKey(name)) {
      index = items[name];
    }
    return index;
  }

  List<int> storageLocations() {
    List<int> result = [];
    for (var i = 0; i < storage.length; i++) {
      if (storage[i] != null) {
        result.add(i);
      }
    }
    return result;
  }

  List<String> names() => this.items.keys;


  int delete(String name) {
    int index = storageLocation(name);
    if (index >= 0) {
      storage[index] = null;
    }
    return index;
  }

  LockerEntry getEntry(String name) {
    int index = storageLocation(name);
    print('Locker.getEntry(): $index');
    return index >= 0 ? storage[index] : null;
  }

  void clear() {
    storage.clear();
    items.clear();
  }
}

class LockerEntry {
  String data;

  LockerEntry(String content) {
    data = content;
  }

  String getContent() {
    return data;
  }
}
