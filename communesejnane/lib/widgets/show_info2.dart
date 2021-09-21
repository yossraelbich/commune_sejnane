import 'package:flutter/material.dart';

class ShowInfo2 extends StatelessWidget {
  final BuildContext context;
  ShowInfo2(this.context);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titleTextStyle: TextStyle(
          color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              child: Icon(
                Icons.close,
                size: 30,
                color: Color(0xFFC2000B),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      content: Container(
        color: Colors.white,
        height: 260,
        width: 300,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "مساحة تفاعلية لتمكين المواطن من التبليغ عن الشكاوى من خلال توثيق الإشكالية بتعليق موجز. بتحديد المكان و بإقتراح للحلول",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'الرجوع',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFC2000B),
                      elevation: 7,
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
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
        ),
      ),
    );
  }
}
