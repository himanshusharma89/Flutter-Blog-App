import 'package:blog_app/helpers/constants.dart';
import 'package:blog_app/views/home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      if (_currentPage != _pageController.page!.round()) {
        setState(() {
          _currentPage = _pageController.page!.round();
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
        children: <Widget>[
          const SizedBox(width: 15.0),
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const WormEffect(
              activeDotColor: Colors.blue,
              dotHeight: 12.0,
              dotWidth: 12.0,
            ),
          ),
          const Spacer(),
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
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  )
                : InkWell(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      PageRouteBuilder<dynamic>(
                        pageBuilder: (_, __, ___) => HomePage(),
                        transitionsBuilder:
                            (_, Animation<double> anim, __, Widget child) =>
                                FadeTransition(opacity: anim, child: child),
                        transitionDuration: const Duration(milliseconds: 1000),
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(15.0)),
                      ),
                      width: 90,
                      height: 49,
                      child: const Center(
                        child: Text(
                          'START',
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
          children: <Widget>[
            const SizedBox(width: 10),
            Image.asset(
              'assets/blog_flutter_light.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
