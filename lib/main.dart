import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:service_now/authentification_Pages/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:service_now/provider/internet_provider.dart';
import 'package:service_now/provider/sign_in_provider.dart';

void main() async {
  // since we use Firebase in our application, we need to initialize it
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => InternetProvider()),
      ],
      child: MaterialApp(
        title: 'Authentification - Login and Register with email and password',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
