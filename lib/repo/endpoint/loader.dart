import 'package:flutter/services.dart';
import 'dart:convert';

class EndpointLoader {
  final String secretPath;

  EndpointLoader({this.secretPath});

  Future<Endpoint> load() {
    return rootBundle.loadStructuredData<Endpoint>(this.secretPath, (s) async {
      return Endpoint.fromJson(json.decode(s));
    });
  }
}

class Endpoint {
  final String address;

  Endpoint({this.address = "https://example.com/doStuff"});

  factory Endpoint.fromJson(Map<String, dynamic> jsonMap) {
    return new Endpoint(address: jsonMap["colours"]);
  }
}
