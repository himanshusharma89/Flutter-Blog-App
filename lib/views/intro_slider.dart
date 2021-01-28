import 'package:after_layout/after_layout.dart';
import 'package:blog_app/models/page_view.dart';
import 'package:blog_app/providers/theme_notifier.dart';
import 'package:blog_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var introSlider = [
  PageViewModel(
    text:
    "Do you have ideas that you want to pen down?",
    image: "Blog3.png",
  ),
  PageViewModel(
    text: "Looking for a spot to write blogs?",
    image: "Blog2.png",
  ),
  PageViewModel(
    text: "You came to the right place!\nWrite, read and even fetch articles from internet!",
    image: "Blog1.jpg",
  ),
];

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with AfterLayoutMixin<Intro>{

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      // Navigator.pushNamed(context, RouteConstant.ROOT);
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (c, a1, a2) => HomePage(),
        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 1500),
      ),);
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (c, a1, a2) => IntroScreen(),
        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 1500),
      ),);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeChange.darkTheme ? Colors.black : Colors.white,
      body: Container()
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      if (_currentPage != _pageController.page.round()) {
        setState(() {
          _currentPage = _pageController.page.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              top: 40,
              bottom: 49,
              child: SizedBox(
                height: 200,
                child: PageView(
                  pageSnapping: true,
                  controller: _pageController,
                  children: introSlider,
                ),
              ),
            ),
            _appBar(),
            bottomNavigation(context)
          ],
        ),
      ),
    );
  }

  Align bottomNavigation(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          const SizedBox(width: 15.0),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: WormEffect(
              activeDotColor: Colors.blue,
              dotHeight: 12.0,
              dotWidth: 12.0,
            ),
          ),
          Spacer(),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _currentPage != 2
                ? SizedBox(
              width: 90,
              height: 49,
              child: IconButton(
                splashColor: Colors.transparent,
                padding: const EdgeInsets.all(0.0),
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                icon: Icon(Icons.arrow_forward_ios_rounded),
              ),
            )
                : InkWell(
              onTap: () =>
                  Navigator.pushReplacement(context, PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => HomePage(),
                    transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 1000),
                  ),),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0)),
                ),
                width: 90,
                height: 49,
                child: Center(
                  child: Text(
                    "START",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Align _appBar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Image.asset(
              "assets/blog_flutter_light.png",
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}