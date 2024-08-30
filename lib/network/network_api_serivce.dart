import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shopping_list/network/base_api_service.dart';
import 'package:shopping_list/network/response/app_exceptions.dart';

class NetworkApiServices extends BaseApiService {
  @override
  Future<Map<String, dynamic>> getApiResponse(String url, Map<String, String> headers) async {
    try {
      final response = await http.get(
        Uri.parse(url),
         headers: headers).timeout(const Duration(seconds: 10));

      return responseJson(response);

    } on SocketException {
      throw InternetException("NO Internet is available right now");
    }
  }

  @override
  Future<Map<String, dynamic>> postApiResponse(String url, Map<String, String> headers, Map body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(body)).timeout(const Duration(seconds: 10)
      );
      return responseJson(response);

    } on SocketException {
      throw InternetException("NO Internet is available right now");
    }
  }

  Map<String, dynamic> responseJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final Map<String, dynamic> data = jsonDecode(response.body);

        return data['data'];

      case 400:
        throw BadRequestException("achi request nhi hai yeh");

      default:
        throw InternetException(
            "${response.statusCode} : ${response.reasonPhrase}");
    }
  }

}
