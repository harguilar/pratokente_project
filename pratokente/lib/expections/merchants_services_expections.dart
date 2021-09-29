class MerchantsServicesExceptions implements Exception {
  final String message;
  final String? devDetails;
  final String? prettyDetails;

  MerchantsServicesExceptions(
      {required this.message, this.devDetails, this.prettyDetails});

  @override
  String toString() {
    return 'MerchantsServicesExceptions: $message ${devDetails != null ? '- $devDetails' : ''}';
  }
}
