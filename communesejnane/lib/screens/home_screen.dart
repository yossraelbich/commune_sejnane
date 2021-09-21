import 'package:communesejnane/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageViewController = PageController();
  final pageViewController2 = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4,
        title: Text("Commune Sejnane"),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 50,
                    left: 50,
                  ),
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Image.asset(
                  'assets/images/sajnen.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'سجنان و موقعها الجغرافي',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 20),
                child: Text(
                  'سجنان مدينة ذ ات أهمية إستراتيجية تعبق بعمق التاريخ و الحضارة والثقافة…وجمال الطبيعة و سحرها \n \nسجنان أحدي مدن الجمهورية التونسية , تقع في ولاية بنزرت جنوب غرب  بنزرت وشمال شرق باجة \n \n  التعداد السكاني 40166\n \n  الترقيم البريدي 7010 \n \n الرمز الجغرافي 2467368\n \n  مساحة معتمديه سجنان 598.89 كلم2',
                  textAlign: TextAlign.end,
                ),
              ),
              Container(
                height: 300,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: PageView(
                        controller: pageViewController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Image.asset(
                            'assets/images/img1.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/img2.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/img3.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/img4.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/img5.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/img6.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: SmoothPageIndicator(
                          controller: pageViewController,
                          count: 6,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) {
                            pageViewController.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: ExpandingDotsEffect(
                            expansionFactor: 2,
                            spacing: 8,
                            radius: 16,
                            dotWidth: 16,
                            dotHeight: 16,
                            dotColor: Color(0xFF9E9E9E),
                            activeDotColor: Color(0xFFB71C1C),
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'سجنان ومواقعها الأثرية والساحلية',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 20),
                child: Text(
                  'تعد معتمدية سجنان من جهة بنزت أبرز الوجهات للأهالي للاصطياف على شواطئها الممتدة والجذابة.. جمال منطقة سجنان وثرواتها الطبيعية المتنوعة والواسعة وموقعها الجغرافي المميز فهي مطلة على  البحر ولها سواحل لا تقل عن 50كلم وبها مساحات غابية تمثل نحو 70بالمائة من مساحتها كما ان ثروات الحديد والرصاص والزنك ليست اقل وجودا من باقي الثروات.اشجار الكلتوس تتطاول في سجنان الى درجة انها تكاد تبلغ عنان السماء والحياة هنا بسيطة وهادئة \n \nوتعد شواطئ كاف عباد وكاب سيراط أبرز البحار التي تجذب زوار جهة بنزرت لنقاوة مياهها وصفائها وهدوء المنطقة الغابية. وهي مقصد آلاف الزوّار على امتداد فترات الحر لاكتشاف جمال الطبيعة ومختلف مكوناتها \n \nويعد شاطئ سيدي المشرق من أروع البحار في تناغم مع الطبيعة والاثار التاريخية. وينتظر تفعيل مشروع القرية الحرفية بسجنان من أجل انتعاشة حرفية بهذه المعتمدية الزاخرة بالفنون والمتجذرة في الثقافة والحضارة.',
                  textAlign: TextAlign.end,
                ),
              ),
              Container(
                height: 300,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: PageView(
                        controller: pageViewController2,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Image.asset(
                            'assets/images/image1.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/image2.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/image3.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/image4.PNG',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/image5.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/image6.jpg',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment(0, 1),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: SmoothPageIndicator(
                          controller: pageViewController2,
                          count: 6,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) {
                            pageViewController2.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          effect: ExpandingDotsEffect(
                            expansionFactor: 2,
                            spacing: 8,
                            radius: 16,
                            dotWidth: 16,
                            dotHeight: 16,
                            dotColor: Color(0xFF9E9E9E),
                            activeDotColor: Color(0xFFB71C1C),
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
