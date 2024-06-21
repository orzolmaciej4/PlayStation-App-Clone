class Message {
  final int id;
  final String text;
  final String sender;
  final String receiver;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.text,
    required this.sender,
    required this.receiver,
    required this.timestamp,
  });
}
