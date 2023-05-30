import 'dart:convert';

import 'package:tcmb_kur/model/kur_model.dart';
import 'package:http/http.dart' as http;

class KurService {
  final String url = "http://hasanadiguzel.com.tr/api/kurgetir";
  Future<KurModel?> fetchKur() async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      var jsonBody = KurModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      print("istek basarisiz oldu =>${res.statusCode}");
    }
  }
}


