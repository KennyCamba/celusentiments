import 'package:celusentiments/models/result.dart';
import 'package:dio/dio.dart';

class StoreService {
  final String _api = "https://postdb-1f55.restdb.io/rest";
  final String _apiKey = "c125e1c5a40984179b88f9553cbb36ab75619";

  Dio _dio = Dio();

  static StoreService instance = StoreService._();

  StoreService._() {
    _dio.options.headers['x-apikey'] = _apiKey;
    _dio.options.baseUrl = _api;
  }

  Future<bool> post(Result result) async {
    final response = await _dio.post("/posts", data: result.toJson());
    return response.statusCode == 201;
  }

  Future<List<Result>> getData() async {
    final response = await _dio.get("/posts");
    List<Result> data = new List<Result>();
    for (final res in response.data) {
      data.add(Result.fromJson(res));
    }
    return data;
  }
}
