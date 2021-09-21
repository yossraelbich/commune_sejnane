import 'package:communesejnane/screens/emergency_screen.dart';
import 'package:communesejnane/screens/form2_screen.dart';
import 'package:communesejnane/screens/form1_screen.dart';
import 'package:communesejnane/screens/map_screen.dart';
import 'package:communesejnane/screens/social_screen.dart';
import 'package:communesejnane/screens/suggestion_screen.dart';
import 'package:communesejnane/screens/transport_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            AppBar(
              title: Text('Commune Sejnane'),
              automaticallyImplyLeading: false,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "خدمات إدارية",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              trailing: Text(
                'تبليغ عن مشكل ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Form2Screen()));
              },
            ),
            Divider(),
            ListTile(
              trailing: Text(
                'نفاذ إلى المعلومة',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Form1Screen()));
              },
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "الرقمنة",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              trailing: Text(
                'دليل المدينة',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => MapScreen()));
              },
            ),
            Divider(),
            ListTile(
              trailing: Text(
                'إرشادات  ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "معلومات عامة",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              trailing: Text(
                'جمع النفايات',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              trailing: Text(
                'طقس ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              trailing: Text(
                'وسائل النقل  ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => TransportScreen()));
              },
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "معلومات عملية",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              trailing: Text(
                'لجان وتقارير البلدية',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              trailing: Text(
                'طوارئ  ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => EmergencyScreen()));
              },
            ),
            Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "شبكات إجتماعية",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Divider(
              thickness: 2,
            ),
            ListTile(
              trailing: Text(
                'مواقع التواصل الإجتماعي    ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SocialScreen()));
              },
            ),
            Divider(),
            ListTile(
              trailing: Text(
                'صحيفة البلدية',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              trailing: Text(
                'فضاء المقترحات  ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SuggestionScreen()));
              },
            ),
            Divider(),
            ListTile(
              trailing: Text(
                'إستفتاء  ',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {},
            ),
            Divider(
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
