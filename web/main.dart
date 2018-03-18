import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_tour_of_heroes/app_component.dart';
import 'package:http/browser_client.dart';
import 'package:angular_tour_of_heroes/in_memory_data_service.dart';
import 'package:http/http.dart';

void main() {
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    // Remove next line in production
    provide(LocationStrategy, useClass: HashLocationStrategy),
    provide(Client, useClass: InMemoryDataService),//useFactory: () => new BrowserClient(), deps: []),
  ]);
}
