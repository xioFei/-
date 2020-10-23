import 'package:flutter/material.dart';
import 'package:flutter_trip/httpUtils/API.dart';
import 'package:flutter_trip/models/patient_apply_model.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // _createItem(BuildContext context, String icon, String name, String time,
    //     String subtite, bool isPass) {
    //   return Padding(
    //     padding: EdgeInsets.only(left: 15, top: 15, right: 15),
    //     child: Expanded(
    //       child: Row(
    //         // mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Container(
    //             height: 40,
    //             width: 40,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.all(Radius.circular(20)),
    //             ),
    //             child: icon == ""
    //                 ? Image.asset(
    //               "Images/avatar.png",
    //             )
    //                 : Image.network(icon, fit: BoxFit.fill),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.only(left: 10),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    // //               children: [
    //                 Row(
    //                   children: [
    //                     Text(name,
    //                         style: TextStyle(
    //                             color: Color(0xff333333),
    //                             fontSize: 15,
    //                             fontWeight: FontWeight.w500)),
    //                     Text(time,
    //                         style: TextStyle(
    //                             color: Color(0xff999999),
    //                             fontSize: 12,
    //                             fontWeight: FontWeight.w400)),
    //                   ],
    //                 ),
    //
    //                 Text(subtite,
    //                     style: TextStyle(
    //                         color: Color(0xff666666),
    //                         fontSize: 13,
    //                         fontWeight: FontWeight.w400)),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }


    _listTranilWidget(BuildContext context, bool isPeriod) {
      if (isPeriod) {
        return Text("已过期",
            style: TextStyle(
                color: Color(0xff333333),
                fontSize: 14,
                fontWeight: FontWeight.w400));
      }else{
        return Container(
          height: 28,
          width: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            color: Color(0x1A0581CE),
          ),
          child: Text("通过",
              style: TextStyle(
                  color: Color(0xff0581CE),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        );
      }
    }

    _createItem(BuildContext context, String icon, String name, String time,
        String subtite, bool isPass) {
      return ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: icon == ""
              ? Image.asset(
            "Images/avatar.png",
          )
              : Image.network(icon, fit: BoxFit.fill),
        ),
        title: Row(
          children: [
            Text(name,
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 15,
                    fontWeight: FontWeight.w500)),
            Text(time,
                style: TextStyle(
                    color: Color(0xff999999),
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        subtitle:
        Text(subtite,
            style: TextStyle(
                color: Color(0xff666666),
                fontSize: 13,
                fontWeight: FontWeight.w400)),
        trailing: _listTranilWidget(context, false),
      );
    }

    return Scaffold(
      body: FutureBuilder<List>(
        future: API.patientApplyList(52366),
        builder: (context, listModel){
          if (listModel.hasData){
            final list =  listModel.data.map((m)=> _createItem(context, "", m.patientName, m.createTime, m.diseaseName + m.diseaseLevel, false)).toList();
            return ListView(
              children: list,
            );
          }else {
            return Text("没有数据");
          }
        },
      ),
    );
  }
}
