import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatMessage {
  final String role;
  final String content;
  final DateTime timestamp;

  ChatMessage({
    required this.role,
    required this.content,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {'role': role, 'content': content};
}

class AiCoachService {
  static const String _serverUrl = 'http://localhost:3001/api/chat';

  static Future<Stream<String>> sendMessage(List<ChatMessage> history) async {
    final body = jsonEncode({
      'messages': history.map((m) => m.toJson()).toList(),
    });

    final request = http.Request('POST', Uri.parse(_serverUrl));
    request.headers['Content-Type'] = 'application/json';
    request.body = body;

    final client = http.Client();
    final streamedResponse = await client.send(request);

    if (streamedResponse.statusCode != 200) {
      client.close();
      throw Exception('Server error: ${streamedResponse.statusCode}');
    }

    final controller = StreamController<String>.broadcast();

    streamedResponse.stream
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .listen(
      (line) {
        if (!line.startsWith('data: ')) return;
        final data = line.substring(6).trim();
        if (data == '[DONE]') {
          controller.close();
          client.close();
          return;
        }
        try {
          final json = jsonDecode(data);
          // Handle error events from proxy
          final error = json['error'];
          if (error != null) {
            controller.addError(Exception(error.toString()));
            return;
          }
          final delta = json['choices']?[0]?['delta']?['content'];
          if (delta != null && delta is String && delta.isNotEmpty) {
            controller.add(delta);
          }
        } catch (_) {}
      },
      onError: (e) {
        if (!controller.isClosed) controller.addError(e);
        client.close();
      },
      onDone: () {
        if (!controller.isClosed) controller.close();
        client.close();
      },
    );

    return controller.stream;
  }
}
