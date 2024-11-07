import 'dart:developer';

import 'package:e_finder_app/models/human_model.dart';
import 'package:e_finder_app/utils/http_client.dart';

import '../models/response_model.dart';

class HumanRepository {

  HumanRepository._();

  factory HumanRepository()=> _instance;

  static final HumanRepository _instance = HumanRepository._();

  Future<List<HumanModel>?> getHumans() async {
    try {
      ResponseModel response = await APIClient().getRequest('cases/humans');
    List<HumanModel> humanList = [];
    if(response.isSuccess && response.data != null && response.data is Map ) {
      List<dynamic> humanData = response.data.containsKey("cases") ? (response.data['cases']['data'] ??[]): [];
      for (var human in humanData) {
        humanList.add(HumanModel.fromJson(human));
      }

      return humanList;
    } else {
      throw Exception(response.message);
    }
    } catch (e, st) {
      log("--------------->$e=========>${st}");
      rethrow;
    }
  }

  Future<HumanModel?> getHumanDetails(int id) async {
    try {
      ResponseModel response = await APIClient().getRequest('cases/humans/$id');
      if(response.isSuccess && response.data != null && response.data is Map ) {
        Map<String, dynamic> data = response.data.containsKey("case") ? response.data['case']:response.data;
        return HumanModel.fromJson(data);
      } else {
        throw Exception(response.message);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}