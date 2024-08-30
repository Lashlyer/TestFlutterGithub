

abstract class BaseApiService {

  Future<Map<String, dynamic>> getApiResponse(String url, Map<String, String> headers);
  Future<Map<String, dynamic>> postApiResponse(String url, Map<String, String> headers, Map body);
}