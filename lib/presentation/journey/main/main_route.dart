import 'package:base_flutter/@core/route/route_define.dart';
import 'main_page.dart';

class MainRoute extends RouteDefine {
  static const main = '/main';

  @override
  List<Path> initRoute(Object? arguments) =>
      [Path(name: main, page: const MainPage())];
}
