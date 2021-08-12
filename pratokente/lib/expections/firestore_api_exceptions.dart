class FirestoreApiExceptions implements Exception {
  final String message;
  final String? devDetails;
  final String? prettyDetails;

  FirestoreApiExceptions(
      {required this.message, this.devDetails, this.prettyDetails});

  @override
  String toString() {
    return 'FirestoreApiExceptions: $message ${devDetails != null ? '- $devDetails' : ''}';
  }
}
