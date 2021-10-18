import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/pages/cart_page.dart';
import 'package:mobile_app/pages/checkout_page.dart';
import 'package:mobile_app/pages/checkout_success_page.dart';
import 'package:mobile_app/pages/edit_profile_page.dart';
import 'package:mobile_app/pages/home/main_page.dart';
import 'package:mobile_app/pages/sign_in_page.dart';
import 'package:mobile_app/pages/sign_up_page.dart';
import 'package:mobile_app/pages/splash_page.dart';
import 'package:mobile_app/providers/auth_provider.dart';
import 'package:mobile_app/providers/cart_provider.dart';
import 'package:mobile_app/providers/page_provider.dart';
import 'package:mobile_app/providers/product_provider.dart';
import 'package:mobile_app/providers/transaction_provider.dart';
import 'package:mobile_app/providers/wishtlist_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishtListProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
        ChangeNotifierProvider(create: (context) => PageProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage()
        },
      ),
    );
  }
}
