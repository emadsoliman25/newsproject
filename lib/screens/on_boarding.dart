import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../page_model.dart';
import 'submit_screens/login_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> pages;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages = List();
    pages.add(PageModel(
      'emad',
      'mdkcmdsncud',
      'assets/images/burger.jpg',
      Icons.gps_not_fixed,
    ));
    pages.add(PageModel(
      'abdullah',
      'dscnkdckswsc',
      'assets/images/pizza.jpg',
      Icons.gps_fixed,
    ));
    pages.add(PageModel(
      'ahmed',
      'njfdjns;',
      'assets/images/falafel.jpg',
      Icons.location_on,
    ));
    pages.add(PageModel(
      'soliman',
      'kdsmckmckms',
      'assets/images/samosa.jpg',
      Icons.sentiment_very_satisfied,
    ));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();

    return Stack(
      children: <Widget>[
        Scaffold(
          /*ppBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),*/
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          pages[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 200, left: 100, right: 100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          pages[index].icon,
                          size: 192,
                          color: Colors.indigo,
                        ),
                        Text(
                          pages[index].title,
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 48,
                            right: 48,
                            top: 5,
                          ),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 350,),
          child: Align(
            //alignment: Alignment.center,
            child: _displayPagesIndicators(pages.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 24,
              right: 35,
              left: 35,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                color: Colors.indigo,
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        _updateSeen();
                        return Login();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayPagesIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 12,
        color: Colors.white30,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.indigo,
        ),
      ),
    );
  }

  void _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
