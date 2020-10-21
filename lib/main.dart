import 'package:flutter/material.dart';
import 'package:flutter_trip/Navigator/TabNavigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget _titleSection = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "这就是一个Text",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  "这就是一个Text",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red),
          Text("10"),
        ],
      ),
    );

    //通过文字 和图片构建一个组件
    Column buildButtonColumn(IconData icon, String label) {
      final _color = Theme.of(context).primaryColor;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: _color),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: _color,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    }

    //构建中间部件
    Widget _middleSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButtonColumn(Icons.phone, "CALL"),
        buildButtonColumn(Icons.map, "ROUTE"),
        buildButtonColumn(Icons.share, "SHARE"),
      ],
    );

    //构建底部组件
    Widget _bottomSection = Container(
      padding: EdgeInsets.all(32),
      child: Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        style: TextStyle(fontSize: 14),
        softWrap: true,
      ),
    );

    final _listView = ListView(
      children: [
        Image.network(
          'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          fit: BoxFit.cover,
        ),
        _titleSection,
        _middleSection,
        _bottomSection,
      ],
    );

    //水平三个图片
    final _horizenImageViewRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(
          'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
        Image.network(
          'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
        Image.network(
          'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
      ],
    );

    //水平三个图片
    final _virticleImageViewColomn = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.network(
          'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
        Image.network(
          'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
        Image.network(
          'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
      ],
    );

    //水平三个图片 121 比例
    final _bigImageViewColomn = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Image.network(
            'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          ),
        ),
        Expanded(
          flex: 2,
          child: Image.network(
            'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          ),
        ),
        Expanded(
          flex: 1,
          child: Image.network(
            'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          ),
        ),
      ],
    );

    //纵向三个图片 121 比例
    final _bigVirticalImageViewColomn = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Image.network(
            'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          ),
        ),
        Expanded(
          flex: 7,
          child: Image.network(
            'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          ),
        ),
        Expanded(
          flex: 1,
          child: Image.network(
            'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          ),
        ),
      ],
    );

    //水平三个图片 111 比例
    final _equalImageViewColomn = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Image.network(
            'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          ),
        ),
        Expanded(
          flex: 1,
          child: Image.network(
            'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          ),
        ),
        Expanded(
          flex: 1,
          child: Image.network(
            'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          ),
        ),
      ],
    );

    //聚焦类型 在中间
    Widget _packedRow = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.red),
        Icon(Icons.star, color: Colors.grey),
        Icon(Icons.star, color: Colors.grey)
      ],
    );

    //构建一个row里面包含 三个colomn colomn中含有三个组件 image icon text
    final _textStyle = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final _threeChildColomn = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.kitchen, color: Colors.green),
        Text("1000"),
        Text("1001"),
      ],
    );

    //DefaultTextStyle 子类会用一样的文本类型 样式
    final _iconList = DefaultTextStyle(
      style: _textStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_threeChildColomn, _threeChildColomn, _threeChildColomn],
      ),
    );

    final _shadowImageWidget = Container(
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Image.network(
                  'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
                ),
                Image.network(
                  'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Image.network(
                  'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
                ),
                Image.network(
                  'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );

    final _shadowEqualImageWidget = Container(
      decoration: BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 8, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Image.network(
                    'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 8, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Image.network(
                    'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 8, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Image.network(
                    'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 8, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  margin: EdgeInsets.all(4),
                  child: Image.network(
                    'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    //网格列表
    List<Container> _buildGridList(int count) {
      return List<Container>.generate(
          count,
          (index) => Container(
              width: 100,
              height: 100,
              child: Image.network(
                  'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png')));
    }

    final _gridWidget = GridView.extent(
      maxCrossAxisExtent: 150,
      padding: EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridList(20),
    );

    //listview使用
    List<Widget> _titleViewList = <Widget>[
      Card(
        child: ListTile(
          leading: Icon(Icons.phone),
          title: Text("这是一个title"),
          subtitle: Icon(Icons.phone),
          trailing: Text("这是一个title"),
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.phone),
          title: Text("这是一个title"),
          subtitle: Icon(Icons.phone),
          trailing: Text("这是一个title"),
          isThreeLine: true,
        ),
      ),
      Card(
        child: ListTile(
          leading: Icon(Icons.phone),
          title: Text("这是一个title"),
          subtitle: Column(
            children: [
              Icon(Icons.phone),
              Icon(Icons.phone),
              Icon(Icons.phone),
              Icon(Icons.phone)
            ],
          ),
          trailing: Text("这是一个title"),
        ),
      ),
    ];

    final _titleListView = ListView(
      children: _titleViewList,
    );

    final _avatar = CircleAvatar(
      child: Expanded(
        flex: 1,
        child: Image.network(
          'http://res.medtion.com/uploads/1/image/public/201810/20181019153547_rewdpigt77.png',
          fit: BoxFit.cover,
        ),
      ),
    );

    return MaterialApp(
      title: '测试',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Center(
        child: TabNavigator(),
      ), //TabNavigator(),
    );
  }
}
