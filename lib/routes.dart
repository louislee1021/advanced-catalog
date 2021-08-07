import 'package:flutter/cupertino.dart';
import 'package:flutter_catalog/pages/cart/cart_page.dart';
import 'package:flutter_catalog/pages/signin/login_page.dart';
import 'pages/home/home_page.dart';

class Routes {
  static String root = "/";

  static String loginRoute = "/login";
  static String homeRoute = "/home";
  static String homeDetailsRoute = "/detail";
  static String cartRoute = "/cart";

  static dynamic configuration([String name]) {
    Map<String, Widget Function(BuildContext)> settings = {
      root : (context) => LoginPage(),
      homeRoute: (context) => HomePage(),
      loginRoute: (context) => LoginPage(),
      cartRoute: (context) => CartPage(),
    };

    return name != null ? settings[name] : settings;
  }
}
