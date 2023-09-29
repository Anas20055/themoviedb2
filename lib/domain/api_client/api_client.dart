import 'dart:convert';
import 'dart:io';

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  // static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = 'f59807f364e102d7cd2816d61804efc0';

  Future<String> auth(String username, String password) async {
    final token =await  makeToken();
    final validToken = await  validateUser(
      username: username,
      password: password,
      requestToken: token ,
    );
    final sessionId = await makeSession(requestToken: validToken );
    return sessionId;
  }

  Future<String> makeToken() async {
    final uri = _makeuri('/authentication/token/new', {'api_key': _apiKey});
    final request = await _client.getUrl(uri);
    final responce = await request.close();
    final json = await responce.jsonDecode();
    final token = json['request_token'] as String;
    return token;
  }

  Future<String> validateUser({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final uri = _makeuri(
        '/authentication/token/validate_with_login', {'api_key': _apiKey});
    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken
    };
    final request = await _client.postUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final responce = await request.close();
    final json = await responce.jsonDecode();
    final token = json['request_token'] as String;
    return token;
  }

  Future<String> makeSession({required String requestToken}) async {
    final uri = _makeuri('/authentication/session/new', {'api_key': _apiKey});
    final parameters = {'request_token': requestToken};
    final request = await _client.postUrl(uri);
    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final responce = await request.close();
    final json = await responce.jsonDecode();
    final sessionId = json['session_id'] as String;
    return sessionId;
  }

  Uri _makeuri(path, Map<String, dynamic>? parameters) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }
}

extension HttpClientResponceJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async =>await  transform(utf8.decoder)
      .toList()
      .then((value) => value.join())
      .then((value) => json.decode(value) as Map<String, dynamic>);
}
