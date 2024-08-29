import 'package:get/get.dart';
import 'package:platon_mobile/page/detail_project/detail_project.dart';
import 'package:platon_mobile/page/home/home.dart';
import 'package:platon_mobile/page/project/project.dart';
import 'package:platon_mobile/page/splash/splash.dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => const HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/project',
        page: () => ProjectPage(),
        middlewares: [MyMiddelware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/task',
        page: () => DetailProjectPage(),
        middlewares: [MyMiddelware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/splash',
        page: () => SplashPage(),
        middlewares: [MyMiddelware()],
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
