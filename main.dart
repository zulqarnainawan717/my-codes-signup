import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shawaya_final/Signup/Component/signup_auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Signup/sign_up_page.dart';
import 'home_screen.dart';
import 'login/components/login_auth_provider.dart';
import 'main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coding Cafe',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.red,
            ),
          ),
        ),
        home: const SignupPage(),
      ),
    );
  }
}
