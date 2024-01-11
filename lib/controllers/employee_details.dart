import 'dart:convert';

import 'package:demo_get_req_getx/models/emp_model.dart';
import 'package:demo_get_req_getx/utils/urls.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;

class EmployeeDetailsController extends GetxController {
  List<EmployeeModel> empDataObj = [];

  Future getEmpDetails() async {
    http.Response response = await http.get(Uri.parse(Urls.url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      empDataObj = data.map((item) => EmployeeModel.fromJson(item)).toList();
      return empDataObj;
    }
  }
}
