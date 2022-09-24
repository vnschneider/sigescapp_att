import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'ui/MenuPages/HomePage.dart';
import 'ui/login/LoginPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

ColorScheme defaultColorScheme = const ColorScheme(
  primary: Color.fromARGB(255, 68, 3, 129),
  secondary: Color.fromARGB(150, 68, 3, 129),
  surface: Color(0xff181818),
  background: Colors.white,
  error: Color.fromARGB(255, 242, 100, 48),
  onPrimary: Color.fromARGB(255, 255, 253, 237),
  onSecondary: Color(0xff000000),
  onSurface: Color.fromARGB(255, 52, 49, 45),
  onBackground: Color.fromARGB(255, 255, 253, 237),
  onError: Color(0xff000000),
  brightness: Brightness.light,
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIGESC',
      theme: ThemeData(
        colorScheme: defaultColorScheme,
        primarySwatch: Colors.indigo,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const LoginWidget();
            }
          },
        ),
      );
}
