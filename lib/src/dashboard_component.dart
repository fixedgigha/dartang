import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'hero.dart';
import 'hero_service.dart';
import 'hero_search_component.dart';
import 'package:logging/logging.dart';

@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  directives: const [CORE_DIRECTIVES, HeroSearchComponent, ROUTER_DIRECTIVES],
  styleUrls: const ['dashboard_component.css'],
)
class DashboardComponent implements OnInit{
  final _log = new Logger('DashboardComponent');

  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  Future<Null> ngOnInit() async {
    _log.info('Loading heroes');
    heroes = (await _heroService.getHeroes()).skip(1).take(4).toList();
  }

}