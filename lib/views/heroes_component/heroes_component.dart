// Copyright (c) 2017, thiers. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:polymer_elements/paper_button.dart';
import 'package:polymer_elements/paper_badge.dart';
import 'package:polymer_elements/paper_card.dart';
import 'package:polymer_elements/paper_tabs.dart';
import 'package:polymer_elements/paper_tab.dart';

import '../hello_dialog/hello_dialog.dart';
import '../hero_detail_component/hero_detail_component.dart';
import '../../model/hero.dart';
import '../../services/hero_service.dart';

@Component(
  selector: 'my-heroes',
  styleUrls: const ['heroes_component.css'],
  templateUrl: 'heroes_component.html',
  directives: const [HeroDetailComponent, materialDirectives, HelloDialog],
  providers: const [HeroService, materialProviders],
)

class HeroesComponent implements OnInit {

final Router _router;
final HeroService _heroService;
List<Hero> heroes;
Hero selectedHero;

HeroesComponent(this._heroService, this._router);

Future<Null> getHeroes() async {
  heroes = await _heroService.getHeroes();
}

void ngOnInit() {
  print('getHeroes()...');
  getHeroes();
}

void onSelect(Hero hero) {
  selectedHero = hero;
}

Future<Null> gotoDetail() =>
    _router.navigate([
      'HeroDetail',
      {'id': selectedHero.id.toString()}
    ]);
}

