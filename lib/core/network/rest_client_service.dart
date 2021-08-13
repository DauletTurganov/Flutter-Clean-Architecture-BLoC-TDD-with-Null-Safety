
import 'package:dio/dio.dart';

class RestClientService {
  late Dio _client;

  RestClientService(Dio client) {
    _client = client;
  }

  Future<Response> get(String url, {Map<String, dynamic>? params}) =>
      _client.get(url, queryParameters: params);
  Future<Response> post(String url, {dynamic body}) =>
      _client.post(url, data: body);
  Future<Response> put(String url, {dynamic body}) =>
      _client.put(url, data: body);
  Future<Response> delete(String url, {dynamic body}) => _client.delete(url);

}
