import 'package:flutter/material.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

void helps(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
      var text = Text;
      return Scaffold(
          appBar: AppBar(
            title: const Text('10 วิธีการช่วยเหลือเบื้องต้น'),
          ),
          body: Stack(
            children: <Widget>[
              // Container(
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/images/w.png"),
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              ListView(children: <Widget>[
                Card(
                  child: GestureDetector(
                      child: Hero(
                        tag: 'imageHero',
                        child: Image.asset('assets/pcr_image/10CPR.png'),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen();
                        }));
                      }),
                ),
                Card(
                  child: SafeArea(
                    // left: true,
                    // top: true,
                    // right: true,
                    // bottom: true,
                    minimum: const EdgeInsets.all(16.0),
                    child: Text(
                        '1. เมื่อพบคนหมดสติ ให้ตรวจดูความปลอดภัยก่อนเข้าไปช่วยเหลือ\n\n'
                        '2. ปลุกผู้ป่วยด้วยเสียงที่ดังและตบไหล่ทั้งสองข้าง\n\n'
                        '3. โทรขอความช่วยเหลือที่สายด่วน 1669\n\n'
                        '4. ประเมินผู้ป่วยว่าหายใจหรือรู้สึกตัวหรือไม่\n\n'
                        '5. ช่วยฟื้นคืนชีพ กดหน้าอกลึกอย่างน้อย 5 เซนติเมตร ในอัตราเร็ว 100-120 ครั้งต่อนาที\n\n'
                        '6. หากมีเครื่องเออีดี (Automated External Defibrillator)ให้เปิดเครื่อง ถอดเสื้อผ้าผู้ป่วยออก\n\n'
                        '7. ติดแผ่นเออีดีหรือแผ่นน้ำไฟฟ้า\n\n'
                        '8. กดปุ่มช็อกและทำการกดหน้าอกหลังทำการช็อกทันที แต่หากเครื่องไม่สั่งช็อกให้ทำการกดหน้าอกต่อไป\n\n'
                        '9. กดหน้าอกต่อเนื่อง ทำ CPR และปฏิบัติตามคำแนะนำของเครื่องเออีดี จนกว่าทีมกู้ชีพจะมาถึง\n\n'
                        '10. ส่งต่อผู้ป่วยให้กับทีมกู้ชีพ เพื่อนำส่งโรงพยาบาล\n\n'),
                  ),
                ),
              ]),
            ],
          ));
    },
  ));
  
}
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.asset('assets/pcr_image/10CPR.png'),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}