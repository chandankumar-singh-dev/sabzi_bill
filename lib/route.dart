import 'package:go_router/go_router.dart';
import 'package:sabzi_bill/features/presentation/screens/app_home_screen.dart';
import 'package:sabzi_bill/features/presentation/screens/customers/add_edit_customer_screen.dart';
import 'package:sabzi_bill/splash_screen.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/',name: "splash",builder: (context, state) => SplashScreen(),),
    GoRoute(path: '/home',name: "home_screen",builder: (context, state) => HomeScreen(),),
    GoRoute(path: '/add_edit_customer_screen',name: "add_edit_customer_screen",builder: (context, state) => AddEditCustomerScreen(),),
  ] 
);