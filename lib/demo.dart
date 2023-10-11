import 'dart:io';
import 'dart:convert';

void main() async {
  // Create an HTTP server that listens on port 8080
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print('Listening on ${server.address}:${server.port}');

  // Listen for incoming requests
  await for (var request in server) {
    if (request.method == 'GET' && request.uri.path == '/api/data') {
      // Handle GET request to /api/data
      final responseData = {'message': 'Hello, World!'};
      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType.json
        ..write(jsonEncode(responseData));
      await request.response.close();
    } else {
      // Handle other routes or methods with a 404 response
      request.response
        ..statusCode = HttpStatus.notFound
        ..write('Not Found');
      await request.response.close();
    }
  }
}
