import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _swiperList = [
    'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
    'http://res.medtion.com/uploads/1/image/public/201907/20190719101037_99fuxnxnl7.jpg',
    'http://120.77.248.37:8087/uploads/mp/20190820/7907365c76104292b48a0807cb1065fd.jpg'
  ];

  _opcityMove(double offset){

    const APPBAR_SCROLL_OFFSET = 100;
    double alpha =  offset / APPBAR_SCROLL_OFFSET;
    setState(() {
      if (alpha < 0){
        _tabOpacity = 0;
      }else if (alpha > 1){
        _tabOpacity = 1;
      }else{
        _tabOpacity = alpha;
      }
    });
  }

  double _tabOpacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: NotificationListener(
              // ignore: missing_return
              onNotification: (scrollNotification){
                if (scrollNotification is ScrollNotification && scrollNotification.depth == 0){
                  _opcityMove(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: [
                  Container(
                    height: 170,
                    child: Swiper(
                      itemCount: _swiperList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(_swiperList[index], fit: BoxFit.fill);
                      },
                      autoplay: true,
                      pagination: SwiperPagination(),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Opacity(
            opacity: _tabOpacity,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
