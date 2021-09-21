import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:http/http.dart' as http;

class SuggestionScreen extends StatefulWidget {
  @override
  _SuggestionScreenState createState() => _SuggestionScreenState();
}

class _SuggestionScreenState extends State<SuggestionScreen> {
  TextEditingController textFieldSolutionsController;

  @override
  void initState() {
    super.initState();

    textFieldSolutionsController = TextEditingController();
  }

  void sendForm() {
    if (textFieldSolutionsController.text == "") {
      DangerBgAlertBox(
        context: context,
        icon: Icons.close,
        infoMessage: "أكتب إقتراح",
        title: "الإقتراع فارغ",
      );
    } else {
      SuccessBgAlertBox(
        context: context,
        icon: Icons.done,
        infoMessage: "شكرا",
        title: "تم الإرسال",
      );
      saveSuggestion();
    }
  }

  Future<void> saveSuggestion() async {
    final url = 'http://10.0.2.2/sajnen/saveSuggestion.php?sugg=' +
        textFieldSolutionsController.text;
    print(url);
    final response = await http.get(Uri.parse(url));

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB71C1C),
        title: Text('فضاء المقترحات'),
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Container(
                // decoration: BoxDecoration(
                //   color: Color(0xFFFFFDE7),
                //   borderRadius: BorderRadius.circular(10),
                //   shape: BoxShape.rectangle,
                //   border: Border.all(
                //     color: Color(0xFFC2000B),
                //     width: 2,
                //   ),
                // ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
                        child: Text(
                          'قدم مقترح',
                          style: TextStyle(
                            fontSize: 22,
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
                        maxLines: 7,
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
                  setState(() {
                    textFieldSolutionsController.text = "";
                  });
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
