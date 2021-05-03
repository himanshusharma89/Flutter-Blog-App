import 'package:blog_app/helpers/launcher.dart';
import 'package:blog_app/providers/medium_article_notifier.dart';
import 'package:blog_app/routes/router.dart';
import 'package:blog_app/views/home.dart';
import 'package:blog_app/views/intro_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:blog_app/providers/theme_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'helpers/theme.dart';

final Launcher launcher = Launcher();

Future<void> main() async {
  LicenseRegistry.addLicense(() async* {
    final String license =
        await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: <ChangeNotifierProvider<ChangeNotifier>>[
        ChangeNotifierProvider<MediumArticleNotifier>(
            create: (_) => MediumArticleNotifier()),
      ],
      child: BlogApp(),
    ),
  );
}

class BlogApp extends StatefulWidget {
  @override
  _BlogAppState createState() => _BlogAppState();
}

class _BlogAppState extends State<BlogApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  late Widget homeWidget;

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    checkFirstSeen();
  }

  Future<void> getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider
        .darkThemePreference
        .getSharedPreferenceValue('themeMode') as bool;
  }

  Future<void> checkFirstSeen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool _seen = prefs.getBool('seen') ?? false;

    if (_seen) {
      setState(() {
        homeWidget = HomePage();
      });
    } else {
      await prefs.setBool('seen', true);
      homeWidget = const IntroScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DarkThemeProvider>(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder:
            (BuildContext context, DarkThemeProvider value, Widget? child) {
          return GestureDetector(
            onTap: () => hideKeyboard(context),
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                builder: (_, Widget? child) =>
                    ScrollConfiguration(behavior: MyBehavior(), child: child!),
                theme: (themeChangeProvider.darkTheme == true)
                    ? darkTheme
                    : lightTheme,
                home: homeWidget,
                onGenerateRoute: RoutePage.generateRoute),
          );
        },
      ),
    );
  }

  void hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
