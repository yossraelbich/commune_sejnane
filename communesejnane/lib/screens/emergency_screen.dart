import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatelessWidget {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB71C1C),
        title: Text('طوارئ'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () => _launchURL("tel:198"),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '198',
                    style: TextStyle(
                      color: Color(0xFFC62828),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'الحماية المدنية',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.local_fire_department,
                    color: Color(0xFFC62828),
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => _launchURL("tel:197"),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '197',
                    style: TextStyle(
                      color: Color(0xFF3F51B5),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'شرطة',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.local_police,
                    color: Color(0xFF3F51B5),
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => _launchURL("tel:193"),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '193',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '\tالحرس الوطني',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.local_police_outlined,
                    color: Colors.green,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () => _launchURL("tel:190"),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '190',
                    style: TextStyle(
                      color: Color(0xFF009688),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '(SAMU) الإسعاف',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.medical_services_sharp,
                    color: Color(0xFF009688),
                    size: 40,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
