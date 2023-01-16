import 'package:ecommerce/utils/route.dart';
import 'package:ecommerce/utils/routes_name.dart';
import 'package:ecommerce/view/cart_screen.dart';
import 'package:ecommerce/view/product_screen.dart';
import 'package:ecommerce/view_models/home_view_model.dart';
import 'package:ecommerce/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'res/app_theme.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization(null);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 1));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeViewModel()),
          ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ],
        child: MaterialApp(
            scrollBehavior: CustomScrollBehavior(),
            title: 'Ecommerce',
            theme: AppTheme().appTheme(),
            initialRoute: RoutesName.homeScreen,
            onGenerateRoute: Routes.generateRoute),);
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }