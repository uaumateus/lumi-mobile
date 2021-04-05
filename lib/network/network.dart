import 'package:http/http.dart' as http;

class Network {
  String get connUrl => 'http://lumibox.centralus.cloudapp.azure.com/api/';

  Future<Map<String, String>> get headers async {
    Map headers = <String, String>{
      'Accept': '/',
      'Access-Control-Allow-Origin': '*',
    };

    headers['Content-Type'] = 'application/json';

    return headers;
  }

  Future<dynamic> post(String route, {Map<String, dynamic> body}) async {
    assert(body != null, 'Body cannot be null in a post request');

    try {
      var res = await http.post('$connUrl$route',
          body: body, headers: await headers);

      return res.statusCode != 204 ? res.body : "";
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> get(String route) async {
    try {
      var response = await http.get('$connUrl$route');
      return response.body;
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> put(String route, {Map<String, dynamic> body}) async {
    assert(body != null, 'Body cannot be null in a post request');

    try {
      var res =
          await http.put('$connUrl$route', body: body, headers: await headers);

      return res.statusCode != 204 ? res.body : "";
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> delete(String route) async {
    try {
      var response = await http.delete('$connUrl$route');

      return response.body;
    } catch (error) {
      print(error);
    }
  }
}
