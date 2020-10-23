import 'package:dio/dio.dart';
import 'package:flutter_trip/httpUtils/http_manager.dart';
import 'package:flutter_trip/models/ApiResponse.dart';
import 'package:flutter_trip/models/PriceListModel.dart';
import 'package:flutter_trip/models/patient_apply_model.dart';

class API {
  ///医生端根据医生id查询待处理的随访申请数目【APP】
  static Future<List<PriceListModel>> visitOrderList(int doctorId) async {
    String url =
        HttpManager.host + '/v1/consulation/priceList.do';
    final pragma = {'type': "T"};
    url =  HttpManager.calcGetUrl(url, Map(), pragma);
    var response = await HttpManager.share().getUrl(
      url,
      queryParameters: pragma,
    );

    if (response == null){
      return null;
    }

    print("res----");
    print(response);
    print("res----");

    var ret = ApiResponse.fromJson(response);
    var list =  ret.data.map((m)=>PriceListModel.fromJson(m)).toList();
    print(list);
    print("list");
    return list;
  }

  ///医生端根据医生id查询随访申请列表【APP】 /dev/api/followup/patient/apply/list
  static Future<List<PatientVisitListModel>> patientApplyList(int doctorId) async {
    String url =
        HttpManager.paitentHost + "/followup/patient/apply/list";
    final pragma = {'doctorId': doctorId.toString()};
    url =  HttpManager.calcGetUrl(url, Map(), pragma);
    var response = await HttpManager.share().getUrl(
      url,
      queryParameters: pragma,
    );

    if (response == null){
      return null;
    }
    print("res----");
    print(response);
    print("res----");

    var ret = ApiResponse.fromJson(response);
    var listRet = ret.data["list"];
    final list =  listRet.map<PatientVisitListModel>((m)=>PatientVisitListModel.fromJson(m)).toList();
    print(list);
    print("list");
    return list;
  }
}
