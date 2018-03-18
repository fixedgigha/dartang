import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'hero_service.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components


@Component(
  selector: 'my-heroes',
  templateUrl: 'heroes_component.html',
  directives: const [COMMON_DIRECTIVES],
  styleUrls: const ['heroes_component.css'],
)
class HeroesComponent implements OnInit {
  final title = 'Tour of Heroes';
  final HeroService _heroService;
  final Router _router;
  HeroesComponent(this._heroService, this._router);
  Hero selectedHero;

  void onSelect(Hero hero) => selectedHero = hero;

  List<Hero> heroes;

  Future<Null> getHeroes() async {
    heroes = await _heroService.getHeroes();
  }

  Future<Null> gotoDetail() =>  _router.navigate([
    'HeroDetail',
    {'id': selectedHero.id.toString()}
  ]);

  Future<Null> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return;
    heroes.add(await _heroService.create(name));
    selectedHero = null;
  }

  Future<Null> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if (selectedHero == hero) selectedHero = null;
  }

  void ngOnInit() => getHeroes();
}
