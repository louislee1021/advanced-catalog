import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const CATALOG_URL = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

class RequestOverrides extends HttpOverrides {
  final bool trustSelfSigned = true;

  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => trustSelfSigned;
  }
}

class Request {
  http.Response response;
  // Singleton
  static Request _instance;
  static Request get instance => _instance ??= new Request();
  // /Singleton

  Request() {
    HttpOverrides.global = new RequestOverrides();
  }

  static Future<Request> get(String url) async {
    instance.response = await http.get(Uri.parse(url));
    return instance;
  }

  void decode({@required Function(Map<String, dynamic>) onDecoded}) {
    final _json = this.response.body;
    onDecoded(jsonDecode(_json));
  }
}
