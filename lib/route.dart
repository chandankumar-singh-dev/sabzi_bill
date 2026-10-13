import 'package:go_router/go_router.dart';
import 'package:sabzi_bill/features/presentation/screens/app_home_screen.dart';
import 'package:sabzi_bill/splash_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/',name: "splash",builder: (context, state) => SplashScreen(),),
    GoRoute(path: '/home',name: "home_screen",builder: (context, state) => HomeScreen(),),
  ] 
);