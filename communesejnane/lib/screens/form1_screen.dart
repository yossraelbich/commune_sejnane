import 'package:communesejnane/widgets/show_info1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:http/http.dart' as http;

class Form1Screen extends StatefulWidget {
  @override
  _Form1ScreenState createState() => _Form1ScreenState();
}

class _Form1ScreenState extends State<Form1Screen> {
  TextEditingController adressController;
  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController emailController;
  TextEditingController paperController;
  TextEditingController responsibleController;
  TextEditingController referenceController;
  bool checkbox1Value = false;
  bool checkbox2Value = false;
  bool checkbox3Value = false;
  bool checkbox4Value = false;

  @override
  void initState() {
    super.initState();
    adressController = TextEditingController();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    paperController = TextEditingController();
    responsibleController = TextEditingController();
    referenceController = TextEditingController();
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return int.tryParse(s) != null;
  }

  void sendForm() {
    if (nameController.text == "") {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "اختر إسم",
        title: "الإسم خاطئ",
      );
    } else if (adressController.text == "") {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر عنوان",
        title: "العنوان خاطئ",
      );
    } else if (phoneController.text.length != 8 ||
        !isNumeric(phoneController.text)) {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر الهاتف",
        title: "الهاتف خاطئ",
      );
    } else if (emailController.text == "" ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر بريد إلكتروني",
        title: "البريد الإلكتروني خاطئ",
      );
    } else if (paperController.text == "") {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر الوثيقة",
        title: "الوثيقة خاطئة",
      );
    } else if (responsibleController.text == "") {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر المسؤول",
        title: "المسؤول خاطئ",
      );
    } else if (checkbox1Value == false &&
        checkbox2Value == false &&
        checkbox3Value == false &&
        checkbox4Value == false) {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "إختر الصورة المطلوبة",
        title: "لم تختر صورة",
      );
    } else {
      SuccessBgAlertBox(
        context: context,
        icon: Icons.done,
        infoMessage: "تم",
        title: "تم إرسال الطلب",
      );
      saveService();
    }
  }

  Future<void> saveService() async {
    String image = "";
    if (checkbox1Value) {
      image += "الإطلاع على الوثيقة على عين المكان";
    }
    if (checkbox2Value) {
      if (image != "") {
        image += "/";
      }
      image += "الحصول على نسخة ورقية";
    }
    if (checkbox3Value) {
      if (image != "") {
        image += "/";
      }
      image += "الحصول على نسخة إلكترونية";
    }
    if (checkbox4Value) {
      if (image != "") {
        image += "/";
      }
      image += "الحصول على مقتطفات من المعلومة";
    }
    final url = 'http://10.0.2.2/sajnen/saveService.php?adress=' +
        adressController.text +
        '&name=' +
        nameController.text +
        '&reference=' +
        referenceController.text +
        '&responsible=' +
        responsibleController.text +
        '&paper=' +
        paperController.text +
        '&email=' +
        emailController.text +
        '&phone=' +
        phoneController.text +
        '&image=' +
        image;
    print(url);
    final response = await http.get(Uri.parse(url));

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB71C1C),
        title: Text('نفاذ إلى المعلومة'),
        centerTitle: true,
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => ShowInfo1(context),
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
                        controller: nameController,
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
                          '* العنوان',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: adressController,
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
                        controller: phoneController,
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
                        controller: emailController,
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
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '* الوثيقة المطلوب النفاذ إليها',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: paperController,
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
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '* الهيكل الإداري المعني',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: responsibleController,
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
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          '( المرجع ( إن وجد',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        controller: referenceController,
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
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                        child: Text(
                          '* الصورة المطلوبة للنفاذ إلى الوثيقة الإدارية',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    CheckboxListTile(
                      value: checkbox1Value,
                      onChanged: (newValue) =>
                          setState(() => checkbox1Value = newValue),
                      title: Text(
                        'الإطلاع على الوثيقة على عين المكان',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      activeColor: Color(0xFFC2000B),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    CheckboxListTile(
                      value: checkbox2Value,
                      onChanged: (newValue) =>
                          setState(() => checkbox2Value = newValue),
                      title: Text(
                        'الحصول على نسخة ورقية',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      activeColor: Color(0xFFC2000B),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    CheckboxListTile(
                      value: checkbox3Value,
                      onChanged: (newValue) =>
                          setState(() => checkbox3Value = newValue),
                      title: Text(
                        'الحصول على نسخة إلكترونية',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      activeColor: Color(0xFFC2000B),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    CheckboxListTile(
                      value: checkbox4Value,
                      onChanged: (newValue) =>
                          setState(() => checkbox4Value = newValue),
                      title: Text(
                        'الحصول على مقتطفات من المعلومة',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      activeColor: Color(0xFFC2000B),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
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
