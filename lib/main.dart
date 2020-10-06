import 'package:blog_app/notifier/medium_Article_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog_app/providers/theme_notifier.dart';
import 'models/theme_data.dart';
import 'screens/home.dart';
import 'routing/route_page.dart';
import 'routing/route_constant.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MediumArticleNotifier()),
        ],
        child:BlogApp(),),
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
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                (themeChangeProvider.darkTheme == true) ? darkTheme : lightTheme,
            home: HomePage(),
            onGenerateRoute: RoutePage.generateRoute,
            initialRoute: RouteConstant.ROOT,
          );
        },
      ),
    );
  }

}
