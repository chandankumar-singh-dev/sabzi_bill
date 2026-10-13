import 'package:go_router/go_router.dart';
import 'package:sabzi_bill/splash_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/',name: "splash",builder: (context, state) => SplashScreen(),)
  ] 
);