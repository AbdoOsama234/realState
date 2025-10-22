import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:real_estate/features/home/view/home_view.dart';

import 'features/auth/view/login_view.dart';
import 'features/auth/view/signup_view.dart';
import 'features/onboarding/cubit/onboarding_cubit.dart';
import 'features/favorite/cubit/favorite_cubit.dart';
import 'root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteCubit>(create: (_) => FavoriteCubit()),
        // BlocProvider<OnboardingCubit>(create: (_) => OnboardingCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate',
      debugShowCheckedModeBanner: false,

      // ✅ تعريب و RTL
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'), // Arabic
        Locale('en'), // English
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // ✅ ثيم افتراضي (اختياري)
      theme: ThemeData(
        fontFamily: 'Cairo',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black45,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.black45,
      ),

      // ✅ الراوتس الأساسية
      routes: {
        '/login': (context) => const LoginView(),
        '/signin': (context) => const SignupView(),
      },

      // ✅ الشاشة الرئيسية
      home: const Root(),
    );
  }
}
