import 'dart:convert';
import 'dart:developer' as developer;

import 'package:hashka/repo/endpoint/loader.dart';
import 'package:http/http.dart' as http;

enum CloudFunction { RANDOM_COLOUR }

abstract class CloudDataProvider {
  var endPoint;

  static Future<CloudDataProvider> create(CloudFunction function) async {
    CloudDataProvider cloudDataProvider;
    switch (function) {
      case CloudFunction.RANDOM_COLOUR:
        cloudDataProvider = ColourDataProvider();
        break;
      default:
        throw ("Unknown function: $function");
    }
    await cloudDataProvider.loadEndpoint();
    return cloudDataProvider;
  }

  Future loadEndpoint();

  Future<String> execute();

  void checkForErrors(http.Response response) {
    ErrorDetector errorDetector = new ErrorDetector(response);
    if (errorDetector.hasError()) {
      throw ("error detected");
    }
  }
}

/// Assumes an endpoint in assets/endpoints.json, e.g.
///  `{
///     "colours": "https://example.com/colours"
///   }`
class ColourDataProvider extends CloudDataProvider {
  @override
  Future<void> loadEndpoint() async {
    await EndpointLoader(secretPath: "assets/endpoints.json")
        .load()
        .then((endPoint) => this.endPoint = endPoint);
  }

  @override
  Future<String> execute() async {
    return http.get(endPoint.address).then(colourTransformer);
  }

  String colourTransformer(http.Response response) {
    developer.log("colourTransformer: statusCode: ${response?.statusCode} input: ${response?.body}");
    checkForErrors(response);
    Map<String, dynamic> json = jsonDecode(response.body);
    return json['colours'];
  }
}

class ErrorDetector {
  static const int _ERROR_STATUS = 400;

  final int _statusCode;

  ErrorDetector(response): assert(response != null),
                           _statusCode = response.statusCode;

  bool hasError() => _statusCode >= _ERROR_STATUS;

  @override
  String toString() => "ErrorDetector: HTTP $_statusCode";
}
