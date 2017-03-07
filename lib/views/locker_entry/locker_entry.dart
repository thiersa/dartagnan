import 'package:angular2/angular2.dart';
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_checkbox.dart';
import 'package:polymer_elements/paper_button.dart';

import '../../model/locker.dart';

@Component(selector: 'locker-entry',
    encapsulation: ViewEncapsulation.Native,
    templateUrl: 'locker_entry.html'
)
class LockerEntryView {
  String name;
  String content;
  @Input() LockerEntry thisEntry;

  @ViewChild('entryForm') NgForm contentForm;
  @ViewChild('nameInput') ElementRef nameInput;
  @ViewChild('contentForm') ElementRef contentInput;

  LockerEntryView() {
    print("$runtimeType()");
  }
}