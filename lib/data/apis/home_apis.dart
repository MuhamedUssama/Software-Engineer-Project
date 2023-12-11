import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/models/home/popular_model.dart';
import 'package:movie_app/interface/utils/strings.dart';

class HomeAPIs {
  static const String token = CommonStrings.token;
  static const String baseApiUrl = CommonStrings.baseApiUrl;

  static Future<List<PopularMovies>> getPopularMovies() async {
    const String endPoint = "popular";

    try {
      Uri url = Uri.parse("$baseApiUrl$endPoint");
      http.Response response = await http.get(url, headers: {
        "Authorization": 'Bearer $token',
      });
      Map json = jsonDecode(response.body);

      PopularModel popularModel = PopularModel.fromJson(json);

      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          popularModel.results?.isNotEmpty == true) {
        return popularModel.results!;
      }
      throw Exception(
          popularModel.message ?? "There is an error, please try again later");
    } catch (e) {
      rethrow;
    }
  }
}
