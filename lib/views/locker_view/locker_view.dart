import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_badge.dart';
import 'package:polymer_elements/paper_card.dart';

import '../../model/locker.dart';
import '../../services/locker_service.dart';

@Component(
    selector: 'locker-view',
    encapsulation: ViewEncapsulation.Native,
    styleUrls: const ['locker_view.css'],
    templateUrl: 'locker_view.html',
    directives: const [materialDirectives],
    providers: const [LockerService, materialProviders]
)

class LockerView implements OnInit {
  final Router _router;
  final LockerService _lockerService;

  @Output()
  EventEmitter del = new EventEmitter<String>();
  @Output()
  EventEmitter add = new EventEmitter();
  @Output()
  EventEmitter sel = new EventEmitter<String>();

  Locker locker;
  String selectedEntry;

  LockerView(this._lockerService, this._router);

  void getLocker() {
    print('LockerView.getLocker()...');
    this.locker = _lockerService.getLocker();
    print(this.locker.getEntry('name 1'));
  }

  void ngOnInit() {
    print('LockerView.ngOnInit()...');
    getLocker();
    var entry = this.locker.getEntry('name 1');
    print(this.locker);
    print(entry.getContent());
  }

  void onSelect(String entry) {
    print("onSelect() - $entry");
    selectedEntry = entry;
  }
}
