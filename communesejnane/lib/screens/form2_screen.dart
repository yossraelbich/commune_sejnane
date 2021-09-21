import 'package:communesejnane/widgets/show_info2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class Form2Screen extends StatefulWidget {
  @override
  _Form2ScreenState createState() => _Form2ScreenState();
}

class _Form2ScreenState extends State<Form2Screen> {
  TextEditingController textFieldGPSController;
  TextEditingController textFieldMailController;
  TextEditingController textFieldNameController;
  TextEditingController textFieldPhoneController;
  TextEditingController textFieldProblemController;
  TextEditingController textFieldSolutionsController;

  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void initState() {
    super.initState();
    textFieldGPSController = TextEditingController();
    textFieldMailController = TextEditingController();
    textFieldNameController = TextEditingController();
    textFieldPhoneController = TextEditingController();
    textFieldProblemController = TextEditingController();
    textFieldSolutionsController = TextEditingController();
    getPos();
  }

  Future<void> getPos() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  Future<void> setGPS() async {
    await getPos();
    textFieldGPSController.text = _locationData.latitude.toString() +
        "," +
        _locationData.longitude.toString();
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  void sendForm() {
    if (textFieldNameController.text == "") {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "اختر إسم",
        title: "الإسم خاطئ",
      );
    } else if (textFieldPhoneController.text.length != 8 ||
        !isNumeric(textFieldPhoneController.text)) {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر الهاتف",
        title: "الهاتف خاطئ",
      );
    } else if (textFieldMailController.text == "" ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(textFieldMailController.text)) {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر بريد إلكتروني",
        title: "البريد الإلكتروني خاطئ",
      );
    } else if (textFieldGPSController.text == "") {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر عنوان",
        title: "العنوان خاطئ",
      );
    } else if (textFieldProblemController.text == "") {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر المشكل",
        title: "المشكل خاطئ",
      );
    } else {
      SuccessBgAlertBox(
        context: context,
        icon: Icons.done,
        infoMessage: "تم",
        title: "تم إرسال الطلب",
      );
      saveProblem();
    }
  }

  Future<void> saveProblem() async {
    final url = 'http://10.0.2.2/sajnen/saveProblem.php?gps=' +
        textFieldGPSController.text +
        '&name=' +
        textFieldNameController.text +
        '&solution=' +
        textFieldSolutionsController.text +
        '&problem=' +
        textFieldProblemController.text +
        '&email=' +
        textFieldMailController.text +
        '&phone=' +
        textFieldPhoneController.text;
    print(url);
    final response = await http.get(Uri.parse(url));

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB71C1C),
        title: Text('التبليغ عن مشكل'),
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ShowInfo2(context),
              );
            },
            icon: Icon(
              Icons.info_outline,
              size: 30,
            ),
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0xFFC2000B),
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text(
                          '* الإسم و اللقب',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: textFieldNameController,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '* الهاتف',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: textFieldPhoneController,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.streetAddress,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '* البريد الإلكتروني',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: textFieldMailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          '* GPS تحديد الموقع',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await setGPS();
                          },
                          icon: Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFFC2000B),
                            size: 40,
                          ),
                          iconSize: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: TextFormField(
                              controller: textFieldGPSController,
                              obscureText: false,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFC2000B),
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFC2000B),
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '* إشرح المشكل بإجاز',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: textFieldProblemController,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        textAlign: TextAlign.end,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                        child: Text(
                          'قدم حلول إن أردت',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: textFieldSolutionsController,
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFC2000B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        textAlign: TextAlign.end,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: ElevatedButton(
                onPressed: () {
                  sendForm();
                },
                child: Text(
                  'إرسال',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC2000B),
                  elevation: 7,
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
