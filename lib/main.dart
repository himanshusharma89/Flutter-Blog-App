import 'package:blog_app/helpers/launcher.dart';
import 'package:blog_app/providers/medium_article_notifier.dart';
import 'package:blog_app/helpers/route_page.dart';
import 'package:blog_app/views/intro_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:blog_app/providers/theme_notifier.dart';
import 'helpers/constants.dart';
import 'views/home.dart';

final Launcher launcher = Launcher();

void main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MediumArticleNotifier()),
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
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme = await themeChangeProvider
        .darkThemePreference
        .getSharedPreferenceValue("themeMode");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return GestureDetector(
            onTap: () => hideKeyboard(context),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              builder: (context, child) =>
                  ScrollConfiguration(behavior: MyBehavior(), child: child),
              theme: (themeChangeProvider.darkTheme == true)
                  ? darkTheme
                  : lightTheme,
              home: Intro(),
              onGenerateRoute: RoutePage.generateRoute,
              initialRoute: RouteConstant.ROOT,
            ),
          );
        },
      ),
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
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
