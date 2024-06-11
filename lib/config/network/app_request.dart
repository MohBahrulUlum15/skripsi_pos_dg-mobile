// import 'dart:convert';

// import 'package:http/http.dart' as http;

// class AppRequest{

//   static Future<Map?> getMethod(String url) async {
//     try {
//       var response = await http.get(Uri.parse(url));
//       Map? responseBody = jsonDecode(response.body);
//       return responseBody;
//     } catch (e) {
//       return null;
//     }
//   }

//   static Future<Map?> postMethod(String url, Object? body) async {
//     try {
//       var response = await http.get(Uri.parse(url));
//       Map<String, dynamic> responseBody = jsonDecode(response.body);
//       return responseBody;
//     } catch (e) {
//       return null;
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class AppRequest {
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static Future<Map?> getMethod(String url, String token) async {
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          ...headers,
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        return null; // or handle error
      }
    } catch (e) {
      return null;
    }
  }

  static Future<Map?> postMethod(String url, Object? body, {String? token}) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          ...headers,
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        return null; // or handle error
      }
    } catch (e) {
      return null;
    }
  }

  static Future<Map?> putMethod(String url, Object? body, String token) async {
    try {
      var response = await http.put(
        Uri.parse(url),
        headers: {
          ...headers,
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        return null; // or handle error
      }
    } catch (e) {
      return null;
    }
  }

  static Future<Map?> deleteMethod(String url, String token) async {
    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: {
          ...headers,
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        return null; // or handle error
      }
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>?> postMethodForFuzzy(String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
