import 'dart:async';

import 'package:angular2/core.dart';

import '../model/locker.dart';
import 'mock_locker.dart';

@Injectable()
class LockerService {
  Locker getLocker() => mockLocker;

  LockerEntry getEntry(String name) => getLocker().getEntry(name);

}