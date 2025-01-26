import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../AppTheme.dart';
import '../navigationBar/navigationBar_student.dart';
import '../notification/student.dart';
import '../profile-screens/female_profile_student.dart';
import '../profile-screens/male_profile_student.dart';
import '../sakn details/ALDiafa/AlDiafa.dart';
import '../sakn details/normal/normal.dart';
import '../setting_details/setting_provider.dart';
import '../side-menu/type_sidemenu/female_student_drawer.dart';
import '../student_screen/bus_time_male.dart';
import '../student_screen/malerules.dart';
import 'details_of_screenhome/details_of_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomemaleStudent extends StatefulWidget {
  const HomemaleStudent({super.key});

  @override
  State<HomemaleStudent> createState() => _HomemaleStudentState();
}

class _HomemaleStudentState extends State<HomemaleStudent> {
  int _currentIndex = 0;
  PageController _pageController = PageController(); // للتحكم في PageView
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Scaffold(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: provider.isDark()
            ? MyTheme.darkTheme.appBarTheme.backgroundColor
            : MyTheme.lightTheme.appBarTheme.backgroundColor,
        title: Center(
            child: Text(_getAppBarTitle(),
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.titleLarge
                    : MyTheme.lightTheme.textTheme.titleLarge)),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon:SvgPicture.asset(
              'assets/image/homeScreen/Vector (2).svg', // مسار الصورة الثانية
              width: 20,
              height: 22,
              color: Colors.white
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotfStudent()),
              );
            },
          ),
        ],
      ),
      drawer: StudentDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          buildHomePage(context),
          maleRules(),
          BusTimeMale(),
          MaleProfileStudent(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBarStudent(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
    );
  }

  Widget buildHomePage(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Column(children: [
      Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.welcome,
                        style: TextStyle(
                          color: Color(0xFFEEA1B3),
                          fontSize: 32,
                          fontFamily: 'Itim',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
              SizedBox(
                height: 10,
              ),
               Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.builds,
                       style: provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyMedium
                  : MyTheme.lightTheme.textTheme.bodyMedium,
                    ),
                  ],
                ),

              DetailsOfScreen(
                title: AppLocalizations.of(context)!.diafa,
                price: AppLocalizations.of(context)!.e,
                photo: 'assets/image/homeScreen/diafa.png',
                detalis_of_bulid: AlDaifScreen(),
              ),
              DetailsOfScreen(
                title: AppLocalizations.of(context)!.normal,
                price: AppLocalizations.of(context)!.e,
                photo: 'assets/image/homeScreen/normal.png',
                detalis_of_bulid: AlNormalScreen(),
              ),
            ]
          ),
        ),
      ))
    ]);
  }

  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 1:
        return AppLocalizations.of(context)!.rules;
      case 2:
        return AppLocalizations.of(context)!.bustime;
      case 3:
        return AppLocalizations.of(context)!.profile;
      default:
        return AppLocalizations.of(context)!.home; // العنوان الافتراضي
    }
  }
}
