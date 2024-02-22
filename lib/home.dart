import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_portfolio/pages/aboutPage.dart';
import 'package:my_portfolio/pages/contactPage.dart';
import 'package:my_portfolio/pages/eduPage.dart';
import 'package:my_portfolio/pages/namePage.dart';
import 'package:my_portfolio/pages/projectPage.dart';
import 'package:my_portfolio/pages/skillPage.dart';

import 'package:my_portfolio/utils/colors.dart';
import 'package:my_portfolio/extensions/hover_extentions.dart';
import 'package:my_portfolio/utils/responsive_widget.dart';
import 'package:rive/rive.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

PageController controller = PageController(keepPage: true);

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool showAppBar = false;
  bool showSwipe = true;
  late AnimationController animationController;
  late TabController tabController;
  double swipeOpacity = 0;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.page! < 0.5)
        showAppBar = false;
      else
        showAppBar = true;

      if (controller.page == 0)
        swipeOpacity = 1;
      else
        swipeOpacity = 0;

      setState(() {});
    });

    animationController = AnimationController(vsync: this);
    tabController = TabController(length: 7, vsync: this);
    startAnimation();
  }

  startAnimation() async {
    await Future.delayed(Duration(milliseconds: 3500));
    swipeOpacity = 1;
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var b = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    final theme = Theme.of(context);

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      drawer: ResponsiveWidget.isLargeScreen(context) ? null : appDrawer(),
      backgroundColor: darkColor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            scrollDirection: Axis.vertical,
            onPageChanged: (page) {
              tabController.animateTo(page);
            },
            children: [
              NamePage(),
              AboutPage(),
              EduPage(),
              ProjectPage(),
              SkillPage(),
              ContactPage(),
            ],
          ),
          AnimatedOpacity(
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 1000),
            opacity: swipeOpacity,
            child: GestureDetector(
              onTap: () {
                controller.animateToPage(1,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: RiveAnimation.asset(
                      'assets/anim/upward_anim.riv',
                    ),
                  )),
            ),
          ),
          if (b / 0.7 > h)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: EdgeInsets.all(min(15, b * 0.05)),
                  child: SocialHandles()),
            ),
          if (ResponsiveWidget.isSmallScreen(context))
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: b * 0.04, vertical: b * 0.04),
                child: Image.asset(
                  'assets/images/menu.png',
                  width: b * 0.05,
                ),
              ),
            ),
          if (ResponsiveWidget.isLargeScreen(context) && showAppBar)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 20, right: 20),
                width: 870,
                child: TabBar(
                  controller: tabController,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Text("Home", style: theme.textTheme.bodyText1!),
                    Text('About', style: theme.textTheme.bodyText1!),
                    Text('Education', style: theme.textTheme.bodyText1!),
                    Text("Experience", style: theme.textTheme.bodyText1!),
                    Text("Projects", style: theme.textTheme.bodyText1!),
                    Text('Skills', style: theme.textTheme.bodyText1!),
                    Text('Contact', style: theme.textTheme.bodyText1!),
                  ],
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: selectColor),
                  onTap: (tab) {
                    controller.animateToPage(tab,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Drawer appDrawer() {
    return Drawer(
      backgroundColor: darkColor,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          drawerItem("Home", 0, Icons.home),
          drawerItem("About", 1, Icons.person),
          drawerItem("Education", 2, Icons.book),
          drawerItem("Experience", 3, Icons.work),
          drawerItem("Projects", 4, Icons.web),
          drawerItem("Skills", 5, Icons.settings),
          drawerItem("Contacts", 6, Icons.email),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.white.withOpacity(0.1),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Follow me at"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(alignment: Alignment.center, child: SocialHandles()),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Baseline(
                  baseline: 36,
                  baselineType: TextBaseline.alphabetic,
                  child:
                      Text('Made with \u2665\n', textAlign: TextAlign.center)),
              Text(' using '),
              Image.asset(
                'assets/images/flutter-icon.png',
                width: 16,
              )
            ],
          ),
        ],
      ),
    );
  }

  drawerItem(String label, double pageNo, IconData icon) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () async {
        Navigator.of(context).pop();
        await Future.delayed(Duration(milliseconds: 500));
        controller.animateToPage(pageNo.floor(),
            duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
      child: ListTile(
        selectedColor: selectColor,
        selected: !controller.hasClients
            ? false
            : (controller.page! < (pageNo + 1)) && (controller.page! >= pageNo),
        leading: Icon(
          icon,
        ),
        title: Text(label, style: theme.bodyText1),
      ),
    );
  }
}

class SocialHandles extends StatelessWidget {
  const SocialHandles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () async {
            await launchUrlString('https://www.instagram.com/gautam_4real/');
          },
          child: Image.asset(
            'assets/images/instagram.png',
            width: h * 0.02,
          ),
        ).showCursor.zoomInOnHover,
        SizedBox(
          width: h * 0.02,
        ),
        GestureDetector(
          onTap: () async {
            await launchUrlString(
                'https://www.linkedin.com/in/gautam-chitransh-a47677205/');
          },
          child: Image.asset(
            'assets/images/linkedin.png',
            width: h * 0.02,
          ),
        ).showCursor.zoomInOnHover,
        SizedBox(
          width: h * 0.02,
        ),
        GestureDetector(
          onTap: () async {
            await launchUrlString('https://github.com/gautamchitrans');
          },
          child: Image.asset(
            'assets/images/github.png',
            width: h * 0.02,
          ),
        ).showCursor.zoomInOnHover,
        SizedBox(
          width: h * 0.02,
        ),
        GestureDetector(
          onTap: () async {
            await launchUrlString('https://twitter.com/gautamchit60557');
          },
          child: Image.asset(
            'assets/images/twitter.png',
            width: h * 0.02,
          ),
        ).showCursor.zoomInOnHover,
      ],
    );
  }
}
