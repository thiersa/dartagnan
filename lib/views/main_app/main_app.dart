import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_icon_button.dart';

import '../../services/hero_service.dart';
import '../heroes_component/heroes_component.dart';
import '../dashboard_component/dashboard_component.dart';
import '../hero_detail_component/hero_detail_component.dart';

@Component(
    selector: 'main-app',
    templateUrl: 'main_app.html',
    directives: const [ROUTER_DIRECTIVES],
    providers: const [HeroService, ROUTER_PROVIDERS])
@RouteConfig(const [
  const Route(
    path: '/dashboard',
    name: 'Dashboard',
    component: DashboardComponent,
    useAsDefault: true),
  const Route(
      path: '/heroes',
      name: 'Heroes',
      component: HeroesComponent),
  const Route(
    path: '/detail/:id',
      name: 'HeroDetail',
      component: HeroDetailComponent)

])

class MainApp {
  String title = 'Tour of Heroes';
}
