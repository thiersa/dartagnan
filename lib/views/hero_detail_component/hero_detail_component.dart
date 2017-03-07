import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:polymer_elements/paper_button.dart';
import 'package:polymer_elements/paper_card.dart';
import 'package:polymer_elements/paper_material.dart';

import 'package:angular2/platform/common.dart';

import '../../services/hero_service.dart';
import '../../model/hero.dart';

@Component(
    selector: 'my-hero-detail',
    styleUrls: const ['hero_detail_component.css'],
    templateUrl: 'hero_detail_component.html'
)
class HeroDetailComponent implements OnInit {
  @Input()
  Hero hero;

  final HeroService _heroService;
  final RouteParams _routeParams;

  final Location _location;

  HeroDetailComponent(this._heroService, this._routeParams, this._location);

  Future<Null> ngOnInit() async {
    var _id = _routeParams.get('id');
    var id = int.parse(_id ?? '', onError: (_) => null);
    if (id != null) hero = await (_heroService.getHero(id));
  }

  void goBack() => _location.back();

}
