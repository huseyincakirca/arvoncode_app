import 'package:flutter/material.dart';

import '../../models/message.dart';
import '../../services/message_service.dart';

class MessagesPage extends StatefulWidget {
  final String token;

  const MessagesPage({super.key, required this.token});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  bool _loading = true;
  String? _error;
  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  Future<void> _fetchMessages() async {
    try {
      final messages =
          await MessageService().fetchMessages(token: widget.token);
      if (!mounted) return;
      setState(() {
        _messages = messages;
        _loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'error';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesajlar'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return const Center(child: Text('Bir hata oluştu'));
    }

    if (_messages.isEmpty) {
      return const Center(child: Text('Henüz mesaj yok'));
    }

    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        final createdAtText = message.createdAt != null
            ? message.createdAt!.toLocal().toString()
            : '';

        return ListTile(
          title: Text(
            message.content,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                createdAtText,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                message.vehicleUuid,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
