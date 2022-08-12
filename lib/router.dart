import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/screen/home.dart';
import 'package:todo_app/screen/utils/user.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: true,
    refreshListenable: router,
    redirect: router._redirectLogic,
    routes: router._routes,
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<User?>(
      userProvider,
      (_, __) => notifyListeners(),
    );
  }
  String? _redirectLogic(GoRouterState state) {
    final user = _ref.read(userProvider);

    _ref.read(userProvider.notifier).isAuthenticated();
    final areWeLoggingIn = state.location == '/login';

    if (user == null) {
      return areWeLoggingIn ? null : '/login';
    }
    if (areWeLoggingIn) return '/Homepage';
    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: '/login',
          builder: (context, _) => Home(),
        ),
        GoRoute(
          name: "DashRoute",
          path: '/HomePage',
          builder: (context, state) => const Home(),
        ),
      ];
}
