import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../AppTheme.dart';
import '../../setting_details/setting_provider.dart';
import '../student/Holiday-exit-permit.dart';
import '../student/Services-provided.dart';
import '../student/about.dart';
import '../student/access-route.dart';
import '../student/delay-allowance.dart';
import '../student/housing-manager.dart';
import '../student/maintenance_request.dart';
import '../student/mywarnings.dart';
import '../student/whatsapplink.dart';

class StudentDrawer extends StatelessWidget {
  const StudentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    return Drawer(backgroundColor: provider.isDark()
        ? MyTheme.darkTheme.scaffoldBackgroundColor
        : MyTheme.lightTheme.scaffoldBackgroundColor,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: provider.isDark() ? MyTheme.kohli : MyTheme.kohli,
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: provider.isDark() ? MyTheme.kohli : Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/image/hti.png",
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
                SizedBox(
                    width:
                        20), // تغيير ارتفاع المسافة إلى عرض لتناسب التباعد الأفقي
                Text(
                  "HTI Housing",
                  style: TextStyle(
                      fontFamily: 'Itim',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/image/slideMenue/DelayIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.late,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Delayallowance()));
            },
          ),
          ListTile(
            leading:
                SvgPicture.asset('assets/image/slideMenue/HolidayIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.allow,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Holidayexitpermit()));
            },
          ),
          ListTile(
            leading:
                SvgPicture.asset('assets/image/slideMenue/servicesIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.servicesProvidedTitle,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Servicesprovided()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/image/maintenance.svg',width: 25,height: 25,color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.request,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MaintenanceRequest()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
                'assets/image/slideMenue/warningIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor), // تأكد من أن الصورة موجودة في ملف الأصول

            title: Text(AppLocalizations.of(context)!.myWarningsTitle,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WarningsScreen(username: "Salma")));
            },
          ),
          ListTile(
            leading:
            SvgPicture.asset('assets/image/slideMenue/locationIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.accross,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Accessroute()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
                'assets/image/slideMenue/HousingManagerIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.manger,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HousingManager()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
                "assets/image/slideMenue/whatsappIcon.svg",color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor
            ),
            title: Text(
              AppLocalizations.of(context)!.whatsappLinkTitle,
              style:provider.isDark()
                  ? MyTheme.darkTheme.textTheme.bodyLarge
                  : MyTheme.lightTheme.textTheme.bodyLarge
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WhatsAppLink()));
            },
          ),
          ListTile(
            leading: SvgPicture.asset('assets/image/slideMenue/aboutIcon.svg',color:provider.isDark()?MyTheme.romadyIconColor:MyTheme.KohliIconColor),
            title: Text(AppLocalizations.of(context)!.about,
                style: provider.isDark()
                    ? MyTheme.darkTheme.textTheme.bodyLarge
                    : MyTheme.lightTheme.textTheme.bodyLarge),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
        ],
      ),
    );
  }
}
