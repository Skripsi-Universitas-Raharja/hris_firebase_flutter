import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hris_firebase_flutter/common/keys.dart';
import 'package:hris_firebase_flutter/view/splash_screen.dart';
import 'package:hris_firebase_flutter/view_model/call_dev_provider.dart';
import 'package:hris_firebase_flutter/view_model/get_data_provider.dart';
import 'package:hris_firebase_flutter/view_model/register_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'view_model/home_provider.dart';
import 'view_model/login_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CallDevProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'HRIS',
        scaffoldMessengerKey: Keys.scaffoldMessengerKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
