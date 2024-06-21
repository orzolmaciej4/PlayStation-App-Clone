import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://latest-video-game-world-news.p.rapidapi.com';

  Future<dynamic> getPlaystationBlog() async {
    final url = Uri.parse('$baseUrl/provider/playstation%20blog');
    final headers = {
      'X-Rapidapi-Key': '4a9bef3537msh981311cb4392ed8p1f085ejsne5c82859eff5',
      'X-Rapidapi-Host': 'latest-video-game-world-news.p.rapidapi.com',
    };

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Handle successful response and parse data
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      // Handle error response
      throw Exception('Failed to load PlayStation blog data');
    }
  }
}
