import 'package:http/http.dart' as http;
import 'dart:io';

class API {
  String _apiUrl='d8248cbb.ngrok.io';
  String _token;

  Future<http.Response> getRequest({String url, String path}) async{
    if(url == null) url = _apiUrl;
    try{
      var uri = Uri.http(url, path);
      var response =  await http.get(
        uri
      );
      return response;
    }catch(error) {
      throw Exception(error);
    }
  }

}