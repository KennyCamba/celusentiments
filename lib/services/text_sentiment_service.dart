import 'package:dio/dio.dart';

class TextSentimentService {
  final String _api =
      "https://celusentiments.cognitiveservices.azure.com/text/analytics/v2.1";
  final String _apiKey = "2ecb0e1ff0254832a2b5b42dcf33a88c";

  Dio _dio = Dio();

  static TextSentimentService instance = TextSentimentService._();

  TextSentimentService._() {
    _dio.options.headers['Ocp-Apim-Subscription-Key'] = _apiKey;
    _dio.options.baseUrl = _api;
  }

  Future<double> post(String text) async {
    final data = {
      "documents": [
        {"language": "es", "id": "1", "text": "$text"}
      ]
    };
    try {
      final response = await _dio.post("/sentiment", data: data);
      return response.data["documents"][0]["score"];
    } on DioError catch (_) {
      return -1;
    }
  }
}
