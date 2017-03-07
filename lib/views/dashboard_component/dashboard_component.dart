import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../model/hero.dart';
import '../../services/hero_service.dart';

@Component(
    selector: 'my-dashboard',
    styleUrls: const ['dashboard_component.css'],
    templateUrl: 'dashboard_component.html',
    directives: const [ROUTER_DIRECTIVES]
)

class DashboardComponent implements OnInit {
  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  Future<Null> ngOnInit() async {
    heroes = (await _heroService.getHeroes()).skip(1).take(4).toList();
  }
}

